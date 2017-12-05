class FoodItem < ApplicationRecord
  belongs_to :restaurant

validates :name, :food_type, :price, presence: true


end
