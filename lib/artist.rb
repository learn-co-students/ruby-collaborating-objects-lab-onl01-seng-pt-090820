require"pry"

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
    #binding.pry
   song.artist = self
  end
  
  
  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def self.find(name)
    Artist.all.find{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find(name)
      return self.find(name)
    else
      return Artist.new(name)
    end
  end
           
          # (1..100).find    { |i| i % 5 == 0 and i % 7 == 0 }   #=> 35     

  def print_songs

    self.songs.each do |song|
        puts song.name
    end
  end
  

end