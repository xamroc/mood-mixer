class MusicItem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :href, type: String
  field :mood, type: String

  validates :href, presence: true
  validates :mood, presence: true

  belongs_to :user

end
