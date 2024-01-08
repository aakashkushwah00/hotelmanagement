class RoomsController < ApplicationController

  # before_action :set_hotel
  
  def index
    @hotel = Hotel.find(params[:hotel_id])
    puts '========================'
    puts @hotel
    @rooms = @hotel.rooms

      # @rooms = Room.all
  end
 

  def show
    @room = Room.find(params[:id])
  end

  def new
    # @room = Room.new
    @hotel = Hotel.find(params[:hotel_id])
  end

  def create 
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.build(room_params)
    if @room.save 
      redirect_to hotel_rooms_path
    else 
      puts @room.errors.inspect
    end
  end

  def edit
    @room = Room.find(params[:id])
    
  end

  def update 

  end

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy 

    redirect_to hotel_rooms_path
  end

  private 

  # def set_hotel 
  #   @hotel = Hotel.find(params[:hotel_id])
  # end

  def room_params
    params.require(:room).permit(:room_type, :room_status, :floor_number, :price, :capacity)
  end

end
