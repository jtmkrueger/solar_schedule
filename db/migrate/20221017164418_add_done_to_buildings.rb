class AddDoneToBuildings < ActiveRecord::Migration[7.0]
  def change
    add_column :buildings, :done, :boolean
  end
end
