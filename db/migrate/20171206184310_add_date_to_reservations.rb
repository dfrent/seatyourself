class AddDateToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :date, :date
  end
end
