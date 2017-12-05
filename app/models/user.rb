class User < ApplicationRecord
  before_save :default_values

  has_and_belongs_to_many :restaurants
  has_many :reservations

  validates :name, :password, :email, presence: true
  validates :email, uniqueness: {message: "%{value} is already taken. Please enter a new email"}


  def default_values
    self.authority ||= 'customer'
  end

end
