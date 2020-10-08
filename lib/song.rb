# creating songs given each filename and sending the artist's name (a string) to the Artist class
# relies on the Artist instances to build associations.
require 'pry'
class Song
  
  attr_accessor :artist, :name
  
  @@all = []
  
  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    names = filename.split(" - ")
    artist = names[0]
    name = names[1]
    song = Song.new(name)
    artist = Artist.find_or_create_by_name(artist)
    song.artist = artist
    song
  end  
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
end