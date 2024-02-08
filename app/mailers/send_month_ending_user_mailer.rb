class SendMonthEndingUserMailer < ApplicationMailer
  def month_ending_email(user)
    @user = user 
    mail(to: @user.email, subject: "[Invite] upcoming Update for you!")
  end
end
