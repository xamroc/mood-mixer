class SessionController < ApplicationController

  def new
    render text: "Display the login form."
  end

  def create
    render text: User.authenticate(params[:user][:email], params[:user][:password]).email
  end

  def destroy
    render text: "Log the user out."
  end

end
