class AddMaxReservationSizeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :max_reservation_size, :integer
  end
end
