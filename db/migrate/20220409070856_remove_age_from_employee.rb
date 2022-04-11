class RemoveAgeFromEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :age, :integer
  end
end
