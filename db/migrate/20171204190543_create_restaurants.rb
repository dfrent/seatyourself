class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :capacity
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
