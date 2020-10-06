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
        Song.all.select {|song_name| song_name.artist == self}
    end

    def self.find_or_create_by_name(artist_name)
        self.detect(artist_name) ? self.detect(artist_name) : self.new(artist_name)
        binding.pry
    end
    
end