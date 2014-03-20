class MusicItem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :href, type: String
  field :mood, type: String

  def add_item(params)
    self.update_attributes(params)
  end
end
