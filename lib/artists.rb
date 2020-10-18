class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genre 
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
   def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  def genres 
    songs.collect { |song| song.genre}.uniq
  end
end