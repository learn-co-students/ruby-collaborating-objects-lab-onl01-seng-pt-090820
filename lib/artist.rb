require 'pry'
class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end  
  
  def add_song(song)
    @songs << song
  end
  
  def songs
    @songs
  end
  
  def self.find_or_create_by_name(name)
    artists = Artist.all.select {|artist| artist.name == name}
    artist = artists[0]
    if artist == nil
      artist = Artist.new(name)
    end
    artist
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end