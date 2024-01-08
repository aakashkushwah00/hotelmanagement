class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_type
      t.string :room_status
      t.integer :floor_number
      t.integer :price
      t.integer :capacity
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
