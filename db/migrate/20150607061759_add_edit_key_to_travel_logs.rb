class AddEditKeyToTravelLogs < ActiveRecord::Migration
  def change
    add_column :travel_logs, :edit_key, :string, null: false
    add_index :travel_logs, :edit_key, unique: true
  end
end
