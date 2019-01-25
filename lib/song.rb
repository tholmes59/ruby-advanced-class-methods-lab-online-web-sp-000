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
    song_instance = self.new 
    song_instance.name = name 
    song_instance.save
    song_instance
  end 
  
  def self.create_by_name(name)
    new_song = self.new 
    new_song.name = name
    new_song.save
    new_song
  end 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}  
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
     self.find_by_name(name)
  else
    self.create_by_name(name)
  end
  end 
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(name)
    song_instance = self.new 
    split_name = name.chomp('.mp3').split(' - ') 
    song_instance.name = split_name[1]
    song_instance.artist_name = split_name[0]
    song_instance
  end
  
  def self.create_from_filename(name)
    song_instance = self.new 
    split_name = name.chomp('.mp3').split(' - ') 
    song_instance.name = split_name[1]
    song_instance.artist_name = split_name[0]
    song_instance.save
    song_instance
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
