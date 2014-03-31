class StatsController < ApplicationController

  before_action :is_authenticated?

  def chart
    @music_data = MusicItem.where( user: current_user )
  end

  def data
    user_music = MusicItem.where( user: current_user )
    happy = user_music.where( mood: "happy").length
    sad = user_music.where( mood: "sad").length
    motivational = user_music.where( mood: "motivational").length
    angry = user_music.where( mood: "angry").length

    @mood_data = {happy: happy, sad: sad, motivational: motivational, angry: angry}
    render json: @mood_data
  end
end
