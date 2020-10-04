require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    song = Song.new(filename[1])
    song.artist = Artist.find_or_create_by_name(filename[0])
    song.artist.add_song(song)
    song
  end  
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
end