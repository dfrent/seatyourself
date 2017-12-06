class User < ApplicationRecord

  has_secure_password

  has_and_belongs_to_many :restaurants
  has_many :reservations

  validates :name, :email, presence: true
  validates :email, uniqueness: { message: "%{value} is already taken. Please enter a new email" }

end
