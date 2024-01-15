class EmployeesController < ApplicationController
  
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @employees = @hotel.employees
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
  end

  def create 
    @hotel = Hotel.find(params[:hotel_id])
    @employee = @hotel.employees.build(employee_params)
    
    if @employee.save 
      redirect_to hotel_employees_path
    else 
      render :new, status: 422
    end
  end

  def edit
  end

  def destroy 
    @employee = Employee.find(params[:id])
    @employee.destroy 

    redirect_to hotel_employees_path
  end 

  private 

  def employee_params 
    params.require(:employee).permit(:first_name, :last_name, :email, :address, :contact_number, :gender, :salary)
  end

end
