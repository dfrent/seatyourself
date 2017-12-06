class RemoveColumnAuthority < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :authority, :string
  end
end
