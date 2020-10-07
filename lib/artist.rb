class Artist 
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def add_song(song)
    @songs << song
    #song.artist = self
  end 
  
  def self.all
    @@all
  end 
  
  def songs 
    @songs
  end 
  
  def self.find_or_create_by_name(name)
    temp_artist = nil
    Artist.all.each {|artist|
      if artist.name = name
        temp_artist = artist 
      end 
    }
    if temp_artist == nil 
      temp_artist = Artist.new(name)
    end 
    temp_artist
  end
  
  def print_songs
    @songs.each {|song|
      puts song.name
    }
  end
  
  
end
