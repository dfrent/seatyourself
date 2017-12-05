class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :time, :size, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number..." }, unless: :restaurant_at_capacity?


private
    def restaurant_at_capacity?
      puts self.restaurant
      if self.size > self.restaurant.capacity
        puts "Restaurant is at capacity"
      end
    end

end
