# every 1.minute do
#   runner "SendWeeklyEmailJob.perform_now"
# end

# every 1.minute do
#   runner "Resque.enqueue(SendMonthEndingEmailJob)"
# end


every '0 0 28-31 * *' do
  # runner "MyMailer.send_email", environment: 'production'
  runner "Resque.enqueue(SendMonthEndingEmailJob)"
end
