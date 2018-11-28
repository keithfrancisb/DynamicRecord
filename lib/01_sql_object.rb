require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @columns[0].map { |column| column.to_sym }
  end

  def self.finalize!
    self.columns.each do |column|

      define_method("#{column}") do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    return nil if data.length == 0
    self.new(data.first)
  end

  def initialize(params = {})
    params.each do |column, value|
      if self.class.columns.include?(column.to_sym)
        self.send("#{column}=", value)
      else
        raise "unknown attribute '#{column}'"
      end
    end
  end

  def attributes
      @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    col_names = self.class.columns.drop(1).join(", ")
    q_marks = (["?"] * self.class.columns.drop(1).length).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
      (#{q_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns[1..-1].join(" = ?, ") + " = ?"

    DBConnection.execute(<<-SQL, *attribute_values[1..-1], self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id.nil? ? self.insert : self.update
  end
end
