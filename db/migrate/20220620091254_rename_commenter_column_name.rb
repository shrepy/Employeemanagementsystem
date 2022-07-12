class RenameCommenterColumnName < ActiveRecord::Migration[6.1]
  def change
     rename_column :comments, :commenter, :description
  end
end
