# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/forgot_password_email
  def forgot_password_email
    UserMailer.forgot_password_email
  end

end
