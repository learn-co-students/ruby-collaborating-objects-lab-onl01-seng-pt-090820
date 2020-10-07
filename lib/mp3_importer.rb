class MP3Importer
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    temp_files = Dir.entries("./spec/fixtures/mp3s/")
    real_files = [] 
    temp_files.each { |file|
      if file.include?(".mp3")
        real_files << file
      end  
    }
    real_files
  end
  
  def import
    self.files.each {|file|
      Song.new_by_filename(file)
    }
    
    
    
    
  end
  
  
end