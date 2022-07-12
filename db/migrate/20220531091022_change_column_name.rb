class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
     rename_column :leafs, :resion, :reason
  end
end
