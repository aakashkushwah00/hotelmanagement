class Hotel < ApplicationRecord
    validates :name, :email, :address, :contact_number, :description, presence: true
    validates :contact_number, numericality: true

    has_many :rooms
    has_many :employees
end
