class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.integer :points
      t.string :month
      t.date :from
      t.date :to
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
