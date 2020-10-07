class MP3Importer
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.glob("#{path}/*.mp3").collect do |filepath|
      filepath.gsub("./spec/fixtures/mp3s/", "")
    end
  end
  
  def import 
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
  
end