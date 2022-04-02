class CreateLeafs < ActiveRecord::Migration[6.1]
  def change
    create_table :leafs do |t|
      t.string :leave_type
      t.date :from_date
      t.date :till_date
      t.string :leave_starts
      t.string :leave_end
      t.float :total_days
      t.string :resion
      t.string :leave_status
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
