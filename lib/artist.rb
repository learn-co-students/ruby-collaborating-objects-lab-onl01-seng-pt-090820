
class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
      self.save
    end

    def add_song(song)
      self.songs << song
    end

    def self.find_or_create_by_name(val)
      tmp = self.all.find {|value| value.name == val}
      if tmp
          return tmp
      else
        newArt = Artist.new(val)
        newArt
      end
    end

    def print_songs
      self.songs.each { |value|  puts value.name}
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end
end
