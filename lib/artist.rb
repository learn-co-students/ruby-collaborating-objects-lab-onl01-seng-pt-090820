class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
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
        item = @@all.select { |item| item.name == name }.first
        item != nil ? item : Artist.new(name)
    end

    def print_songs
        puts songs.select { |song| puts song.name }
    end

end