class Room < ApplicationRecord
  belongs_to :hotel
  has_one_attached :room_image


  # validates :room_type, :room_status, :price, :capacity, :floor_number, presence: true
  # validates :price, :capacity, numericality: true
end
