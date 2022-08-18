class CreateGlobelSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :globel_settings do |t|
      t.date :leave_increment_date

      t.timestamps
    end
  end
end
