class MusicList

  include Mongoid::Document

  # needs to save a list of music-mood objects
  belongs_to :user


end