class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.string :status
      t.string :hour
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
