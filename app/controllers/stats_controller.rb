class StatsController < ApplicationController

  before_action :is_authenticated?

  def chart
    @music_data = MusicItem.where( user: current_user )
  end

  def data
    user_music = MusicItem.where( user: current_user )
    happy_count = user_music.where( mood: "happy").length
    sad_count = user_music.where( mood: "sad").length
    motivational_count = user_music.where( mood: "motivational").length
    angry_count = user_music.where( mood: "angry").length

    @mood_data = {  happy: happy_count,
                    sad: sad_count,
                    motivational: motivational_count,
                    angry: angry_count
                  }
    render json: @mood_data
  end
end
