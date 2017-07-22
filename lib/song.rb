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
song = self.new
self.all << song
song
  end

def self.new_by_name(name)
song = self.new
song.name = name
song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  self.all << song
  song

end

def self.find_by_name(name)

self.all.detect{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  if find_by_name(name)
    find_by_name(name)
  else
    create_by_name(name)
  end
end

def self.alphabetical
  all.sort_by{|song| song.name}
end

def self.new_from_filename(file)
  	split_file = file.split(/[-.]/)
  	name = split_file[1].strip
  	artist = split_file[0].strip
  	song = self.new
  	song.name = name
  	song.artist_name = artist
  	song
 end

def self.create_from_filename(file)
  song = new_from_filename(file)
  song.save
end

def self.destroy_all
  all.clear
end
end
