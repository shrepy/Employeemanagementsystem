class CreateIps < ActiveRecord::Migration[6.1]
  def change
    create_table :ips do |t|
      t.string :unblockip

      t.timestamps
    end
  end
end
