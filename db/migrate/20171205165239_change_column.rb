class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :open, :open_time
    rename_column :restaurants, :close, :close_time
  end
end
