require 'csv'

class CsvExportService
  def initialize(data)
    @data = data
  end

  def generate_csv 

    attributes = Hotel.column_names
    CSV.generate(headers: true) do |csv|
      csv << attributes
      # csv << csv_headers

    @data.all.each do |hotel|
      csv << attributes.map { |attr| hotel.send(attr) }
    end
end


  end

  private 

#   def csv_headers
#     @data.first.attributes.keys
#   end
end