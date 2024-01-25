class RenameOldColumnNameToNewColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :rooms, :room_status, :description
  end
end
