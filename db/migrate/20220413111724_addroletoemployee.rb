class Addroletoemployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :role, foreign_key: true
  end
end
