class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  def initialize(name, artist= NIL, genre = NIL)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = Song.new(name)
    song.save 
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
  end
  
  # def self.find_by_name(name)
  #   self.all.detect{|song| song.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end
  
  def self.new_from_filename(file)
    song_name = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    genre_name = file.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
  
  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end
end

