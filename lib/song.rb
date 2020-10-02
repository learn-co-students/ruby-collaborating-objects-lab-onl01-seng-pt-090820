class Song
    attr_accessor  :artist, :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
        artist.add_song(self)
      end

    def save
        @@all << self
    end

    def self.new_by_filename(filename)
        song = Song.new(filename.split(" - ")[1])
        song.artist = Artist.new(filename.split(" - ")[0])
        song
      end

end
