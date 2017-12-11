class FoodItem < ApplicationRecord
  belongs_to :restaurant

validates :name, :food_type, :price, presence: true

validates :food_type, inclusion:{in:  %w(appetizer entree desserts alcohol drink side)}

  def all_food_types
    type_array = ["appetizer", "entree", "desserts", "alcohol", "drink", "side"]
    type_array
  end

end
