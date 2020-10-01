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

    def artist_name=(artist_name)
        # self.artist = Artist.find_or_create_by_name(artist_name)
        Artist.find_or_create_by_name(artist_name).add_song(self)
    end

    def self.new_by_filename(filename)
        # split_filename = filename.split(" - ")
        # new_song = self.new(split_filename[1]) if self.all.none? {|song| song.name == split_filename[1]}
        # song_artist = split_filename[0]
        # # binding.pry
        # new_song.artist_name = song_artist
        # new_song
        new_song = self.new(filename.split(" - ")[1])
        new_song.artist_name = filename.split(" - ")[0]
        new_song
    end
end