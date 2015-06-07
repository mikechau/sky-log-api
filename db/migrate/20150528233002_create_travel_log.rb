class CreateTravelLog < ActiveRecord::Migration
  def change
    create_table :travel_logs do |t|
      t.string :key, null: false
      t.jsonb :data, default: {}
      t.timestamps
    end

    add_index :travel_logs, :key, unique: true
  end
end
