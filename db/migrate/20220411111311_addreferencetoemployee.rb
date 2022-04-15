class Addreferencetoemployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :designation, foreign_key: true
    remove_column :employees, :destination, :string
  end
end
