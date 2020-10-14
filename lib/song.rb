require 'pry'
class Song
  attr_accessor :artist, :name
  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  def self.new_by_filename(value)
    splt = value.split(/ - /)
    newClass = Song.new(splt[1])
    newClass.artist_name = (splt[0])
    newClass
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
    #binding.pry
  end

  def save
    @@all << self
  end
end
