class UserNotifier < ActionMailer::Base

  default from: "MoodMixer <webmaster@moodmixer.com>"

  def create_user(user)
    @user = user
    mail to: @user.email, subject: "[MoodMixer] Your account was created"
  end

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[MoodMixer] Reset your credentials"
  end

  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: "[MoodMixer] Password was reset"
  end

end