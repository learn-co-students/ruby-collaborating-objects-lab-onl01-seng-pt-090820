require 'pry'

class Artist 
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end 
  
  def self.find_or_create_by_name(name)
    if self.all.find{|artist| artist.name == name} 
      self.all.find{|artist| artist.name == name}
    else 
      name = Artist.new(name)
      name
    end
  end
  
  def print_songs
    song_instances = self.songs
    songs = song_instances.map do |song|
      # binding.pry
      song.name
    end
    print songs
  end 

end