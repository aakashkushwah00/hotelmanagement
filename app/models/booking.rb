class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # validates :check_in_date, :check_out_date, :name, presence: true
  
end
