class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :employee_type, default: 0, null: false

      t.timestamps
    end
  end
end
