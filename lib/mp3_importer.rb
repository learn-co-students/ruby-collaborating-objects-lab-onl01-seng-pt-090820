require "pry"

class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  
  def files
    Dir.glob("#{@path}/*.mp3").map do |track|
      track.gsub("#{@path}/", "")
    end
  end
  
  
  def import
    files.each do |song|
      #binding.pry
    Song.new_by_filename(song)
  end
  end
  
  
end