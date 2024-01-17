class RoomsController < ApplicationController

  # before_action :set_hotel
  # before_action :set_room, only: [:edit, :update]

  def allroom 
    @rooms = Room.all 
  end 

  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = @hotel.rooms
  end
 

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
  end

  def create 
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.create(room_params)
      redirect_to hotel_rooms_path
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.find_by(id: params[:id], hotel_id: params[:hotel_id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])

    if @room.update(room_params)
      redirect_to hotel_rooms_path(@hotel), notice: 'Room was successfully updated.'
    else
      render :edit
    end
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

  # def set_room
  #   @room = @hotel.rooms.find(params[:id])
  # end

  def room_params
    params.require(:room).permit(:room_type, :room_status, :floor_number, :price, :capacity, :room_image)
  end

end
