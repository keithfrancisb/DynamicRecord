require_relative 'lib/01_sql_object'

class Song < DynamicRecord::Base

  belongs_to :album
  belongs_to :artist
  has_one_through :genre, :artist, :genre

  finalize!
end

class Album < DynamicRecord::Base

  belongs_to :artist

  has_one_through :genre, :artist, :genre

  finalize!
end

class Artist < DynamicRecord::Base

  belongs_to :genre

  has_many :songs
  has_many :albums

  finalize!
end

class Genre < DynamicRecord::Base

  has_many :artists

  finalize!
end
