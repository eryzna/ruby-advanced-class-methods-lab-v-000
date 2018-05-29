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
    self.new.save
    self.all[-1]
  end

  def self.new_by_name(song_name)
    #@name=name
    song=self.new
    song.name=song_name
    song
  end

  def self.create_by_name(song_name)
    song=self.new
    song.name=song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name==song_name}
  end

  def self.find_or_create_by_name (song_name)
    if self.find_by_name==nil
      self.create_by_name
    else
      self.find_by_name
    end
  end
end
