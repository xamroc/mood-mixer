class UserCreator

  def create_user( params )
    User.create(
      { email: params[:email],
        password: params[:password]
      }
    )
  end

end