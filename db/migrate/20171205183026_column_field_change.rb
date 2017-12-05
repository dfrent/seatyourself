class ColumnFieldChange < ActiveRecord::Migration[5.0]
  def change

    change_column :restaurants, :open_time, :integer
    change_column :restaurants, :close_time, :integer

  end
end
