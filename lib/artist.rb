class Artist
  attr_accessor :name
  attr_reader :songs
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

def save
  @@all << self
end

def self.find_or_create_by_name(name)
  self.all.detect {|artist| artist.name == name} || Artist.new(name)
end

def print_songs
  @songs.each { |song| puts song.name}
end

end

#song_one = Song.new("Rock With You")
#artist = Artist.new("Michael Jackson")
#puts artist.name
#artist2 = Artist.new("")
#artist2.name = "Prince"
#puts artist2.name
