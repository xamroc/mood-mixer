class SessionController < ApplicationController

  def new
    # render text: "Display the login form."
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    password = params[:user][:password]
    if password.blank?
      #password reset flow
      PasswordResetter.new(flash).handle_reset_request(user_params)
    else
      #user authenticate flow
      UserAuthenticator.new(session, flash).authenticate_user(user_params)
    end
    (redirect_to root_url and return) if flash.empty?
    render :new
  end

  # def create
  #   # @user = User.authenticate(params[:user][:email], params[:user][:password])
  #   user = User.find_by(email: params[:user][:email])
  #   password = params[:user][:password]

  #   if password.blank?
  #     # render text: "Time to reset password."
  #     user.set_password_reset if user
  #     UserNotifier.reset_password(user).deliver
  #     flash.now[:notice] = "We'll send you an email."
  #     render :new
  #   elsif user and user.authenticate(password) #for any account, valid or not
  #     session[:user_id] = user.id
  #     redirect_to root_url
  #   else
  #     flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
  #     render :new
  #   end
  # end

  def destroy
    session[:user_id] = nil
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
