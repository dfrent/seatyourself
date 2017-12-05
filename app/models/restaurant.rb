class Restaurant < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :reservations
  has_many :food_items

  validates :name, :location, :capacity, :open_time, :close_time, presence: true

  def available_times

  end

  def price_range
    price_array = food_items.sort_by {|item| item.price}
    price_array
  end

end
