require 'pry'

class Artist 
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def songs 
    Song.all.select {|song| song.artist==self}
  end 
  
  def add_song(song)
    song.artist = self
    @songs << song
  end 
  
  def self.find_or_create_by_name(name)
    self.all.detect { |artist| artist.name == name} || self.new(name)
  end 
  
  def print_songs
    @songs.each { |song| puts song.name}
  end
  
end 