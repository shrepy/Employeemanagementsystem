class AddColumnToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :last_task_update, :date
  end
end
