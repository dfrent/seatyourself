class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate  :room_in_restaurant?
  validates :time, :size, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number..." }

  def room_in_restaurant?
    current_bookings = 0
    restaurant.reservations.each do |reservation|
      current_bookings += reservation.size
    end

    current_capacity = restaurant.capacity - current_bookings

    if size < current_capacity
      true
    else
      errors.add(:size, "of reservation is too large. Apologies!")
    end
  end

end
