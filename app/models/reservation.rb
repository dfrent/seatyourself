class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :time, :size, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number..." }, unless: :restaurant_at_capacity?

  def room_in_restaurant?
    current_bookings = 0
    restaurant.reservations.each do |reservation|
      current_bookings += reservation.size
    end

    current_capacity = restaurant.capacity - current_bookings

    size < current_capacity
  end

end
