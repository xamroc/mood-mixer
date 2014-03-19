  class PasswordController < ApplicationController

  LINK_EXPIRED = "Your reset link has expired, Please generate a new one"
  RESET_SUCCESS = "Your password has been successfully reset."

  def edit
    unless @user = User.find_by_code( params[:code] )
      redirect_to login_url, notice: LINK_EXPIRED
    end
  end

  def update
    if @user = User.find_by_code( params[:code] )
    # if user is found
      u = PasswordResetter.new(flash).reset_password(@user, user_params)
      binding.pry
      if u
        return if log_user_in( @user, RESET_SUCCESS )
      end
      render :edit

    # otherwise show a message not found
    else
      render text: "No code found"
    end

  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end


end