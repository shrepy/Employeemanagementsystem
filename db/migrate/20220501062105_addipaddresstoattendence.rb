class Addipaddresstoattendence < ActiveRecord::Migration[6.1]
  def change
    add_column :attendences, :checkin_ip_address, :string
    add_column :attendences, :checkout_ip_address, :string
  end
end
