class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    @users = User.all.entries
    @user_music_items = current_user.music_item.all.entries
  end

  def privacy
  end

  def terms
  end
end
