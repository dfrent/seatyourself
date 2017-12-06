class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validate  :room_in_restaurant?
  validate  :in_the_past?
  validate  :after_close?
  validate  :before_open?
  validates :time, :size, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number." }
  validates :size, numericality: { :greater_than_or_equal_to => 1, message: "of reservation can't be negative." }

  def room_in_restaurant?
    current_bookings = 0
    restaurant.reservations.where(time: "#{self.time}").each do |reservation|
      current_bookings += reservation.size
    end

    current_capacity = restaurant.capacity - current_bookings

    if size <= current_capacity
      true
    else
      errors.add(:size, "of reservation is too large. Apologies!")
    end
  end

  def after_close?
    if self.time.to_i > restaurant.close_time
      errors.add(:time, "of reservation cannot be after closing hours.")
    end
  end

  def before_open?
    if self.time.to_i < restaurant.open_time
      errors.add(:time, "of reservation cannot be before opening hours.")
    end
  end

  def in_the_past?
    if self.date < Date.today
      errors.add(:date, "of reservation cannot be in the past.")
    end
  end

end
