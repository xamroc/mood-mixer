class MusicController < ApplicationController

  def new
    render :new
  end

  def create
    render text: "Music Created!!"
  end
end