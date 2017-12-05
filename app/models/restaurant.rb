class Restaurant < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :reservations
  has_many :food_items

  validates :name, :location, :capacity, :open, :close, presence: true

end
