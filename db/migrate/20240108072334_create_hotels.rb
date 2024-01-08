class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.integer :contact_number
      t.string :email

      t.timestamps
    end
  end
end
