class Hotel < ApplicationRecord
  validates :name, :email, :address, :contact_number, :description, :hotel_image, presence: true
  validates :contact_number, numericality: true,length: { in: 10..12 }

  has_many :rooms, dependent: :destroy
  has_many :employees, dependent: :destroy

  has_one_attached :hotel_image

end
