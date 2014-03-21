class MusicItem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :href, type: String
  field :mood, type: String

  belongs_to :user

end
