class Restaurant < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :reservations
  has_many :food_items

#
  validates :name, :location, :capacity, :open_time, :close_time, :max_reservation_size, presence: true
  validates :max_reservation_size, numericality: { message: "%{value} seems wrong. Please enter a number." }
  validates :max_reservation_size, numericality: { :greater_than_or_equal_to => 1, message: " can't be negative." }

  def time_display(restaurant_time)
    if restaurant_time.in_time_zone("UTC").hour == 0
      "12 AM"
    elsif restaurant_time.in_time_zone("UTC").hour == 12
      "12 PM"
    elsif restaurant_time.in_time_zone("UTC").hour > 12
      "#{(restaurant_time - 12.hours).in_time_zone("UTC").hour} PM"
    elsif restaurant_time.in_time_zone("UTC").hour < 12 && restaurant_time.hour != 0
      "#{restaurant_time.in_time_zone("UTC").hour} AM"
    end
  end

  def available_times
    first_slot = open_time.hour
    last_slot  = close_time.hour

    if last_slot < first_slot
      last_slot += 24
    end

    hours_open = last_slot - first_slot
    reservation_slots = []
    hour = 0

    hours_open.times do
      reservation_slots << open_time + hour.hours
      reservation_slots << open_time + (hour + 0.5).hours
      hour += 1
    end
    reservation_slots
  end

  def price_range
    price_array = food_items.sort_by {|item| item.price}
    price_array
  end

  def self.look_for(search)
    where("name LIKE ? OR location LIKE ? OR capacity LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
