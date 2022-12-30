class AddColumnToAttendences < ActiveRecord::Migration[6.1]
  def change
    add_column :attendences, :break, :string
  end
end
