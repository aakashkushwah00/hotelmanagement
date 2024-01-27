class PaymentsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.find(params[:room_id])
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'inr',
          product_data: {
            name: @room.room_type,
            description: @room.capacity,
            # images: ['https://media.istockphoto.com/id/1328049157/photo/mens-short-sleeve-t-shirt-mockup-in-front-and-back-views.jpg?b=1&s=170667a&w=0&k=20&c=CZ5Emlrh-C4jzojJ8b8YBy1frxpQr6aMcLmEBrkty7Q=']
            # images: [@room.room_photo]
          },
          unit_amount: @room.price*100 # amount in paisa
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: 'http://localhost:3000/payments/success',
      cancel_url: 'http://localhost:3000/payments/cancel'
    )
  end
  def success
    # Handle successful payment
    # You can access the Checkout Session ID via params[:session_id]
    flash[:success] = "Payment successful!"
    redirect_to root_path
  end

  def cancel
    flash[:error] = "Payment cancelled."
    redirect_to products_path
  end
end
