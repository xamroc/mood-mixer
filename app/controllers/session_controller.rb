class SessionController < ApplicationController

  def new
    render text: "Display the login form."
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user_id
      render text: "Logged in yo! #{@user.email}"
    else
      render text: "Who are you?"
    end
  end

  def destroy
    render text: "Log the user out."
  end

end
