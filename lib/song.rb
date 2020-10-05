require"pry"

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
    #binding.pry
    artist_and_title = filename.split(" - ")
    artist_and_title.pop
    
    @artist_string = artist_and_title[0]
    @title_string = artist_and_title[1]
    #binding.pry
    song = self.new(@title_string)
        
    song.artist_name = @artist_string
    return song

  end
  

def artist_name=(artist)
    #binding.pry
  artist_new = Artist.find_or_create_by_name(artist)

  self.artist = artist_new
  artist_new.add_song(self)
  
end
  
  
end