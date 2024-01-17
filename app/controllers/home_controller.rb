class HomeController < ApplicationController
  def index
  end

  def about 
  end

  def room
    @rooms = Room.all
  end

  def blog 
  end 

  def contact 
  end

 
end
