# DynamicRecord

## Overview
DynamicRecord is an Object-relational mapping(ORM) tool inspired by the ORM of Ruby on Rails known as ActiveRecord. ORM is usually used to convert rows in tables in a database into a data type that has associations with rows of other tables. This data type is then easier to use when it comes to utilizing the data fetched from the database. This is usually accomplished using object-oriented programming languages. DynamicRecord, like ActiveRecord, is able to make these associations between different tables from a database and converting them into classes, which are the models of an MVC structure.

## How to Setup
1. Clone this repository.
2. Navigate to the cloned repository in the terminal.
3. Once inside the root directory of the repository, type in the following commands in the terminal:
```bash
bundle install
```
4. After installation, start pry:
```bash
bundle exec pry
```
5. In pry, load the entry file by typing in the following code:
```
load 'dynamic_record.rb'
```

## Sample DynamicRecord Models and Associations
Below are the defined models based on the sample database included within this repository.

```ruby
class Song < DynamicRecord::Base
  belongs_to :album
  belongs_to :artist
  has_one_through :genre, :artist, :genre
end
```

```ruby
class Album < DynamicRecord::Base
  belongs_to :artist
  has_one_through :genre, :artist, :genre
end
```

```ruby
class Artist < DynamicRecord::Base
  belongs_to :genre
  has_many :songs
  has_many :albums
end
```

```ruby
class Genre < DynamicRecord::Base
  has_many :artists
end
```

## Fetching data from the Database
DynamicRecord provides methods that allows developers to fetch data from the database. Some methods are able to fetch a list of data, while some are able to find specific data.


### ::all
Fetches a list of all the rows in a table in a database as models.
```ruby
Song.all
Album.all
Artist.all
Genre.all
```

### ::find(id)
Fetches a specific row in a table with the exact id provided.
```ruby
Song.find(8) # => returns a song called 'King of the Clouds' by 'Panic! at the Disco'.
Artist.find(2) # => returns an artist named 'Ariana Grande'.
Genre.find(4) # => returns the genre 'Country'.
```

### ::where(params)
Allows you to limit the data fetched by specifying certain conditions in the form of a hash.
```ruby
song = Song.where(name: 'King of the Clouds').first # => returns a song called 'King of the Clouds' by 'Panic! at the Disco'.
Album.where(id: song.album_id) # => returns an album called 'Pray For The Wicked'
```

## Forming Associations between tables in a database
One of the benefits of using an ORM tool is the ability to form associations between data from tables in a database. DynamicRecord allows developers to form. Refer to the associations defined in the models above.

### `belongs_to`
```ruby
song = Song.find(8) # => 'King of the Clouds'
song.artist # => 'Panic! At The Disco'
song.album # => 'Pray For The Wicked'
```

### `has_many`
```ruby
panic = Artist.find(1) # => 'Panic! At The Disco'
panic.albums # => 'Pray For The Wicked', A Fever You Can't Sweat Out'
```

### `has_one_through`
```ruby
everytime = Song.find(30) # => 'everytime' by 'Ariana Grande'
everytime.genre # => 'Pop'

anything_goes = Album.find(5) # => 'Anything Goes' by 'Florida Georgia Line'
anything_goes.genre # => 'Country'
```
