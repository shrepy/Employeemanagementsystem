class DeviseTokenAuthCreateEmployees < ActiveRecord::Migration[6.1]
  def change
    
    change_table :employees do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""
      t.json :tokens
      #t.timestamps
    end

     add_index :employees, [:uid, :provider],     unique: true

    # add_index :employees, :unlock_token,         unique: true
  end
end
