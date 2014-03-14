class SessionController < ApplicationController

  def new
    @messages = flash.map {|key,value| "#{key.upcase} #{value}"}.join(";")
    # render text: "Display the login form."
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      # render text: "Logged in yo! #{@user.email}"
      redirect_to root_url
    else
      render text: "Who are you?"
    end
  end

  def destroy
    session[:user_id] = nil
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've successfully logged out."
  end

end
