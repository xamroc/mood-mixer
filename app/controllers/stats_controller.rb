class StatsController < ApplicationController

  before_action :is_authenticated?

  def chart
    music_data
  end

  def data
    happy_count = music_data.where( mood: "happy").length
    sad_count = music_data.where( mood: "sad").length
    motivational_count = music_data.where( mood: "motivational").length
    angry_count = music_data.where( mood: "angry").length

    @mood_data = {  happy: happy_count,
                    sad: sad_count,
                    motivational: motivational_count,
                    angry: angry_count
                  }
    render json: @mood_data
  end

  private

  def music_data
    @music_data = MusicItem.where( user: current_user )
  end
end
