class UserMailer < ApplicationMailer

  def forgot_password_email(user)
    @user = user 
    # @reset_password_url = edit_user_password_url(@user, reset_password_token: @user.reset_password_token)
    mail(to: 'aakashkushwah9012@gmail.com', subject: 'Reset Your Password')
  end

end
