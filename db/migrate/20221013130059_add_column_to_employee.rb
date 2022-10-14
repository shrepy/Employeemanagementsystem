class AddColumnToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :alternate_phone_number, :string
    add_column :employees, :alternate_email, :string
    add_column :employees, :alternate_address, :string
    add_column :employees, :reference_name, :string
    add_column :employees, :reference_contact_number, :string
  end
end
