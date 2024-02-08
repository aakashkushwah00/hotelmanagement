require 'resque'

class SendMonthEndingEmailJob
    @queue = :emails
  
    def self.perform(*args)
      user = User.find(27)
      SendMonthEndingUserMailer.month_ending_email(user).deliver_now
    end
    
end