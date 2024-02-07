class HotelsController < ApplicationController

  before_action :set_hotel, only: [:show, :edit, :update]

  def index
    @hotels = Hotel.all

    respond_to do |format|
      format.html
      # format.csv { send_data @hotels.generate_csv, filename: 'hotels- #{Date.today}.csv' }  
      format.csv { send_data CsvExportService.new(@hotels).generate_csv, filename: 'hotels- #{Date.today}.csv' }  
                                                                    
    end
  end

  def show 
    # @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create 
    @hotel = Hotel.new(hotel_params)
    if @hotel.save 
      redirect_to hotels_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    # @hotel = Hotel.find(params[:id])
  end

  def update 
    # @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render :edit
    end
  end 

  def destroy 
    hotel = Hotel.find(params[:id])
    hotel.destroy 

    redirect_to hotels_path, status: :see_other
  end

  # CSV ( comma separated values ) import bluk data.......
  
  def import_csv
    csv_file = params[:file]
    CSV.foreach(csv_file.path, headers: true) do |row|
      Hotel.create(row.to_h)
    end
    redirect_to hotels_path, notice: 'CSV imported successfully'
  end


  private 

  def set_hotel 
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :email, :contact_number, :description, :address, :hotel_image )
  end
  
end
