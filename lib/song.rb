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
  
  def self.new_by_filename(file)
    song = Song.new(file.split(" - ")[1])
    @artist = file.split(" - ")[0]
    # binding.pry
    song
  end 
  
  def artist_name(name)
    if Song.artist 
      Song.artist.name 
    else
      Artist.new(name)
    end
  end
  
end