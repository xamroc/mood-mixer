class UserNotifier < ActionMailer::Base

  default from: "MoodMixer <webmaster@moodmixer.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[MoodMixer] Reset your credentials"
  end

  def password_was_reset(user)
  end

end