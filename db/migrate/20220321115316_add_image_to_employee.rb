class AddImageToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :image, :string
  end
end
