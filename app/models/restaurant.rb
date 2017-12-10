class Restaurant < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :reservations
  has_many :food_items

#
  validates :name, :location, :capacity, :open_time, :close_time, :max_reservation_size, presence: true
  validates :max_reservation_size, numericality: { message: "%{value} seems wrong. Please enter a number." }
  validates :max_reservation_size, numericality: { :greater_than_or_equal_to => 1, message: " can't be negative." }
  # validates :open_time, numericality: { :greater_than_or_equal_to => 1, message: "can't be below 1." }
  # validates :close_time, numericality: { :less_than => 25, message: " can't be above 24." }

  def time_display(restaurant_time)
    if restaurant_time.in_time_zone("EST").hour == 0
      "12 AM"
    elsif restaurant_time.in_time_zone("EST").hour == 12
      "12 PM"
    elsif restaurant_time.in_time_zone("EST").hour > 12
      "#{(restaurant_time - 12.hours).in_time_zone("EST").hour} PM"
    elsif restaurant_time.in_time_zone("EST").hour < 12 && restaurant_time.hour != 0
      "#{restaurant_time.in_time_zone("EST").hour} AM"
    end
  end

  # def available_times
  #   time_spent_open = (close_time - open_time)
  #   first_time = open_time
  #   time_list = []
  #
  #   (open_time..close_time - 1).to_a.each do |hour|
  #     time_list << hour
  #     time_list << hour + 0.5
  #   end
  #
  #   time_list.map! do |time_slot|
  #
  #     if time_slot.class == Float
  #       if time_slot == 0.5 || time_slot == 24.5
  #         time_slot = "12:30 AM"
  #       elsif time_slot == 12.5
  #         time_slot = "12:30 PM"
  #       elsif time_slot >= 13
  #         time_slot = "#{time_slot.to_i - 12}:30 PM"
  #       else
  #         time_slot = "#{time_slot.to_i}:30 AM"
  #       end
  #     elsif time_slot.class == Integer
  #       if time_slot == 0 || time_slot == 24
  #         time_slot = "12 AM"
  #       elsif time_slot == 12
  #         time_slot = "12 PM"
  #       elsif time_slot >= 13
  #         time_slot = "#{time_slot - 12} PM"
  #       else
  #         time_slot = "#{time_slot} AM"
  #       end
  #     end
  #   end
  #   time_list
  # end

  def price_range
    price_array = food_items.sort_by {|item| item.price}
    price_array
  end

  def self.look_for(search)
    where("name LIKE ? OR location LIKE ? OR capacity LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
