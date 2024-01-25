class BookingMailer < ApplicationMailer

  def booking_success(user)
    @user = user 
    # @booking = booking
    # to_address = @user.email
    mail(to: user.email , subject: 'Room Booking Confirmation')
  end
  
  def booking_cancel(user)
    @user = user 
    # @booking = booking
    # to_address = @user.email
    mail(to: user.email , subject: 'Room Cancel Confirmation')
  end
  
end
