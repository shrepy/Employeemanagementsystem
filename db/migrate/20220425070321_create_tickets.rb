class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :status
      t.text :description
      t.string :ticket_type
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
