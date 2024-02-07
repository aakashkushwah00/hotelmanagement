class UserRagistationMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email , subject: 'Welcome to Our Hotel ')
  end

end

