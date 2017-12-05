class Restaurant < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :reservations
  has_many :food_items

  validates :name, :location, :capacity, :open_time, :close_time, presence: true

  def available_times
    time_spent_open = (close_time - open_time).to_f
    first_time = open_time
    time_list = []
    ((time_spent_open.to_i) * 2).times do |time|
      time_list << first_time
      first_time += 0.5
    end
    time_list.sort
  end

  def price_range
    price_array = food_items.sort_by {|item| item.price}
    price_array
  end

end
