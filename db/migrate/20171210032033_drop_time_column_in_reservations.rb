class DropTimeColumnInReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :time, :integer
    change_column :reservations, :date, :datetime
    change_column :restaurants, :open_time, :datetime
    change_column :restaurants, :close_time, :datetime
  end
end
