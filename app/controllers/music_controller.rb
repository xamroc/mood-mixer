class MusicController < ApplicationController

  before_action :is_authenticated?

  def new
    render :new
  end

  def create
    # puts "This is #{@current_user}"

    # @music_item = current_user.music_items.create(music_params)

    # if @music_item.valid?

    if @music_item = MusicItem.new(music_params)
      @music_item.user = current_user
      if @music_item.save
        redirect_to root_url
      else
        render text: "Fail to save music item."
      end
    else
      render text: "Fail to create new music item."
    end
  end

  def list
    @result = MusicItem.where( mood: params["mood"] )
    # puts @result
    # @user_music_items = current_user.music_item.all.entries
    # respond_to do |format|
    #   format.js
    # end
    render json: @result
  end

  private

  def music_params
    params.require(:music_item).permit(:href, :mood)
  end
end