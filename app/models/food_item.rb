class FoodItem < ApplicationRecord
  belongs_to :restaurant

validates :name, :food_type, :price, presence: true

validates :food_type, inclusion:{in:  %w(appetizer entree desserts alcohol drink side)}

def all_food_types
  type_array = ["appetizer", "entree", "desserts", "alcohol", "drink", "side"]
  type_array
end

# def validate(food_item)
#   unless FoodItem.food_type  != ("appetizer", "entree", "desserst", "drink", "drink-non", "side")
#     food_item.errors[:food_type]
# end

end
