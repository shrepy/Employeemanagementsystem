class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.integer :age
      t.string :phone_number
      t.text :address
      t.integer :trainer_id
      t.string :destination

      t.timestamps
    end
  end
end
