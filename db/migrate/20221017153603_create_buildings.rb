class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.integer :building_type, default: 0, null: false

      t.timestamps
    end
  end
end
