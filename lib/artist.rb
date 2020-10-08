require 'pry'

class Artist
    @@all = []

    attr_accessor :name
    attr_reader :songs
    # this way the artist will be able to tell us about it's associated songs(has many songs)
    def initialize(name)
        @name = name
        @@all << self
        @songs = [] 
        # an artist has many songs, means we have an instance variable of an array that stores songs
    end

    def Artist.all
        # self.all
        @@all
        # this returns all existing artist instances
    end

    def add_song(song)
        @songs << song # unless @song.include?(song) # unless the song is already in @ songs
         song.artist = self unless song.artist == self # unless the artist is the instance itself(==). 
    # we need to add an associated song 
    # this would send a message to the artist object that we want to add the song
    # method takes in song arguement which will be added to the song array  
  
    end 

    # Artist.find_or_create_by_name method is a class method
    # def self.find_or_create_by_name(name)
    #     self.find_by_name || self.create_by_name
    #     # we want to have a way of creating an artist, that will allow us to retreive an artist that already exist so that we dont make ayny duplicates
    # end

    # def self.find_by_name
    #     @@all.detect do |artist| artist.name == name
    #     end
    # end

    # def self.create_by_name
    # self.new(name).save
    # end

    # def save
    #     @@all << self
    #     self
    # end

    def self.find_or_create_by_name(artist_name)
        self.find(artist_name) ? self.find(artist_name) : self.new(artist_name)
    end

    def self.find(name)
        self.all.detect {|artist| artist.name == name}
    end

    def print_songs
        @songs.each {|songs| puts songs.name}
    end

end