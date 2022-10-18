class CreateEmployeePtos < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_ptos do |t|
      t.integer :pto_type, default: 0, null: false
      t.date :pto_date
      t.integer :employee_id

      t.timestamps
    end
  end
end
