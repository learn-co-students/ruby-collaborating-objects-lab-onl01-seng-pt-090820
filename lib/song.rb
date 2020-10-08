# class Song 
#     attr_reader :songs, :name
#         # this way the song will be able to tell us about it's associated artist(belongs to an artist)
#     def initialize(name)
#         @name = name
#         @artist = nil
#         # when we say that as song belongs to an artist, 
#         # we mean that a song has an instance variable @artist that stores the associated artist object
#         # in this case it starts off empty "nil"
#     end
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
    
        def artist_name=(name)
            self.artist = Artist.find_or_create_by_name(name)
            artist.add_song(self)
        end
    
        def self.new_by_filename(filename)
            artist, song = filename.split(" - ")
            new_song = self.new(song)
            new_song.artist_name = artist
            new_song
        end
    end