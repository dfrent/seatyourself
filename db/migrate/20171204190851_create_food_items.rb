class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.integer :restaurant_id
      t.string :name
      t.string :type
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
