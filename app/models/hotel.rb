# require 'csv'

class Hotel < ApplicationRecord
  validates :name, :email, :address, :contact_number, :description, :hotel_image, presence: true
  validates :contact_number, numericality: true,length: { in: 10..12 }

  has_many :rooms, dependent: :destroy
  has_many :employees, dependent: :destroy

  has_one_attached :hotel_image

  # def self.to_csv 
  #   # attributes = %w{name address}
  #   attributes = Hotel.column_names
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes

  #     all.each do |employees|
  #       csv << attributes.map{|attr| employees.send(attr)}
  #     end
  #   end
  # end

end
