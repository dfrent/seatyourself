class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :time, presence: true
  validates :size, numericality: { message: "%{value} seems wrong. Please enter a number..." }

end
