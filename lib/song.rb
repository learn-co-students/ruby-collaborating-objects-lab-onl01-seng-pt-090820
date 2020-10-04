class Song 

attr_accessor :name, :artist 
@@all = [ ]

def initialize(name)
  @name = name 
  @@all << self 
end 

def self.all 
  @@all 
end 

def self.new_by_filename(song)
 
end 

def artist_name=(name)
  self.artist = Artist.find_or_create_by_name(name)
end

def self.new_by_filename(name)
  Song.new(name)
end 
  
  
end 