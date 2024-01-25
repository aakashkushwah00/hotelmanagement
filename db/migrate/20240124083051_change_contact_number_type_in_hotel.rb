class ChangeContactNumberTypeInHotel < ActiveRecord::Migration[7.1]
  def change
    change_column :hotels, :contact_number, :bigint
  end
end
