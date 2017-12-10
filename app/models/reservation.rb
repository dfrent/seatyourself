class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  # validate  :room_in_restaurant?
  validate  :in_the_past?
  validate  :reservation_too_large?
  validate  :in_proper_hours?
  validates :date, :size, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number." }
  validates :size, numericality: { :greater_than_or_equal_to => 1, message: "of reservation can't be negative." }

  def display_res_time
    date_display = date.inspect.split
    return "#{date_display[0]} #{date_display[2]}. #{date_display[1]}"
  end

  # def room_in_restaurant?
  #   current_bookings = 0
  #   restaurant.reservations.where(time: "#{self.time}").each do |reservation|
  #     current_bookings += reservation.size
  #   end
  #
  #   current_capacity = restaurant.capacity - current_bookings
  #
  #   if size <= current_capacity
  #     true
  #   else
  #     errors.add(:size, "of reservation is too large. Apologies!")
  #   end
  # end

  def reservation_too_large?
    if size > restaurant.max_reservation_size
      errors.add(:size, "of reservation is too large. Must be #{restaurant.max_reservation_size} or less.")
    end
  end

  def after_close?
    if restaurant.close_time.hour < restaurant.open_time.hour
      military_close_time = restaurant.close_time.hour + 24
    end

    if self.date.hour < restaurant.open_time.hour
      military_reservation = self.date.hour + 24
      if military_reservation > military_close_time
        true
      end
    elsif restaurant.close_time.hour > restaurant.open_time.hour
      if self.date.hour > restaurant.close_time.hour
        true
      end
    end

  end

  def before_open?
    if self.date.hour < restaurant.open_time.hour
      true
    end
  end

  def in_proper_hours?
    if before_open? || after_close?
      errors.add(:date, "of reservation must be during operating hours.")
    end
  end

  def in_the_past?
    if self.date < Date.today
      errors.add(:date, "of reservation cannot be in the past.")
    end
  end

end
