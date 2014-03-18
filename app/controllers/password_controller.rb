class PasswordController < ApplicationController

  def edit
    @user = User.find_by code: params[:code]
    redirect_to login_url, notice: "Your reset link has expired, Please generate a new one" unless @user
  end

  def update
    @user = User.find_by code: params[:code]

    if @user

      if params[:user][:password].blank?
        @user.errors.add(:password, "This field can't be blank")
      elsif @user.update_attributes user_params
        render text: "Success!"
      else
        render text: "Failure!"
      end

    else
      render text: "No code found"
    end
    # render text: @user.errors.messages
  #   if @user.update user_params
  #     render text: "Success"
  #   else
  #     render text: "Oops"
  #   end
  end

  private

  def user_params # strong parameters
    params.require(:user).permit(:password, :password_confirmation)
  end

end