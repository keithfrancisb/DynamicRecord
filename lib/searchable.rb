require_relative 'db_connection'
require_relative 'base'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ? " }.join(" AND ")

    data = DBConnection.execute(<<-SQL, params.values)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        (#{where_line})

    SQL

    parse_all(data)
  end
end
