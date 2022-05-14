class Addjoindatetoemployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :joining_date, :date
  end
end
