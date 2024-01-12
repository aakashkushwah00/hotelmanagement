class Room < ApplicationRecord
  belongs_to :hotel

  # validates :room_type, :room_status, :price, :capacity, :floor_number, presence: true
  # validates :price, :capacity, numericality: true
end
