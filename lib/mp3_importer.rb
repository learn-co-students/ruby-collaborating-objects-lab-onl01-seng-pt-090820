class MP3Importer 

attr_accessor :path
  
  def initialize(file_path) 
    @path = file_path
  end
  
  def files
    filenames = Dir.chdir(@path){|path| Dir.glob("*.mp3")}
    filenames
  end
  
  def import
    filenames = self.files
    filenames.each{|filename| Song.new_by_filename(filename)}
  end
    
end