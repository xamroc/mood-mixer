class SessionController < ApplicationController

  def new
    render text: "Display the login form."
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    render text: "Log the #{email} user in with #{password}."
  end

  def destroy
    render text: "Log the user out."
  end

end
