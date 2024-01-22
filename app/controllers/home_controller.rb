class HomeController < ApplicationController
  def index
  end

  def about 
  end

  def show 
    @room = Room.find(params[:id])
  end 

  def allhotels 
    @hotels = Hotel.all
  end

  # def room
  #   @rooms = Room.all
  # end

  def hotelrooms 
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = @hotel.rooms
  end

  def blog 
  end 

  def contact 
  end

end
