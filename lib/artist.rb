# responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).
require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
 
  def songs
    #return array of all songs that belong to self
    #get all existing song instances from song
    #select only the ones associated with artist instances
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    # Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out
    self.find(name) ? self.find(name) : self.new(name)
  end
  
  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end
  
  def self.all_artists
    self.all.map {|artist| artist.name}
  end
  
  def print_songs
    #instance methods outputs the names of all songs associated with this Artist instance
    self.songs.each do |song|
      puts song.name
    end
  end
  
end