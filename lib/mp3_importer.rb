require"pry"
class MP3Importer
    attr_accessor :path, :mp3

    @@mp3s = []

    
    def initialize(path)
        @path = path
        #Dir.entries(".")

    end
    
    def files
        #@@mp3s << Dir.entries("#{@path}").select { |f| File.file? File.join("#{@path}", f) }
        @@mp3s << Dir.chdir("#{@path}") { Dir.glob("*.mp3") }
        @@mp3s.flatten
    end
        #binding.pry

    def import
        @@mp3s.each { |filename| Song.new_by_filename(filename) }
      end
      #binding.pry
  end