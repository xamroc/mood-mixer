class MusicItem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :href, type: String
  field :mood, type: String

  before_save :get_video_id
  validates_presence_of :title
  validates_presence_of :href
  validates_presence_of :mood

  belongs_to :user

  protected

    def get_video_id
      if self.href.present?
        self.href = self.href.split("=").last
      end
    end

end
