# Preview all emails at http://localhost:3000/rails/mailers/user_ragistation_mailer
class UserRagistationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_ragistation_mailer/welcome_email
  def welcome_email
    UserRagistationMailer.welcome_email
  end

end
