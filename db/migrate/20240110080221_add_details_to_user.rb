class AddDetailsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :dob, :date
  end
end
