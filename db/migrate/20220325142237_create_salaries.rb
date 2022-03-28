class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer :salary
      t.string :month
      t.integer :total
      t.references :employee, null: false, foreign_key: true
        
      t.timestamps
    end
  end
end
