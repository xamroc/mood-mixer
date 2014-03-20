class MusicItem

  include Mongoid::Document

  field :href, type: String
  field :mood, type: String

end
