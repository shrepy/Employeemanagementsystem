class CreateDailyTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_tasks do |t|
      t.text :description
      t.integer :rank, default: 10
      t.references :employee, null: false, foreign_key: true

      
      t.timestamps
    end
  end
end
