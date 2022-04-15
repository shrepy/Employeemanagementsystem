class AddAgeToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :date_of_birth, :date
  end
end
