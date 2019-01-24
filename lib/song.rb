class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new 
    new_song.save
    new_song
  end 
  
  def self.new_by_name(name)
    @name = name
    song_instance = self.new 
    song_instance.name = name 
    song_instance.save
    
  end 
  
end
