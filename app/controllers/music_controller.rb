class MusicController < ApplicationController

  before_action :is_authenticated?

  def new
    render :new
  end

  def create
    if MusicItem.new.add_item(music_params)
      redirect_to root_url
    else
      render text: "Fail."
    end
  end

  private

  def music_params
    params.require(:music_item).permit(:href, :mood)
  end
end