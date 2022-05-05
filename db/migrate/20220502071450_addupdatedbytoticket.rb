class Addupdatedbytoticket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :updated_by, :string
    add_column :tickets, :reason, :string
  end
end
