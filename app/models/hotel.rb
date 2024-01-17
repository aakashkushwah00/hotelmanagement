class Hotel < ApplicationRecord
    validates :name, :email, :address, :contact_number, :description, presence: true
    validates :contact_number, numericality: true

    has_many :rooms, dependent: :destroy
    has_many :employees, dependent: :destroy

  has_one_attached :hotel_image

end
