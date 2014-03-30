class MusicController < ApplicationController

  before_action :is_authenticated?

  def new
    render :new
  end

  def create
    if @music_item = MusicItem.new(music_params)
      @music_item.user = current_user
      if @music_item.save
        redirect_to root_url
      else
        flash.now[:alert] = "Music link and mood must be entered."
      end
      render :new
    else
      flash.now[:alert] = "Failed to create music item."
    end
  end

  def list
    @result = MusicItem.where( user: current_user, mood: params["mood"] )
    # puts @result
    # @user_music_items = current_user.music_item.all.entries
    # respond_to do |format|
    #   format.js
    # end
    render json: @result
  end

  private

  def music_params
    params.require(:music_item).permit(:title, :href, :mood)
  end
end