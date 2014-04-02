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
        flash.now[:alert] = "Please make sure all fields are filled."
        render :new
      end
    else
      flash.now[:alert] = "Failed to create music item."
      render :new
    end
  end

  def list
    @result = MusicItem.where( user: current_user, mood: params["mood"] )
    render json: @result
  end

  private

  def music_params
    params.require(:music_item).permit(:title, :href, :mood)
  end
end