class Addemployeedetailstoemployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :department, :string
    add_column :employees, :bank_name, :string
    add_column :employees, :account_number, :string
    add_column :employees, :pan_card_number, :string
    add_column :employees, :aadhar_card_number, :string
    add_column :employees, :salary, :integer
    add_column :employees, :primary_skill, :text
  end
end
