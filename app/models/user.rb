class User < ApplicationRecord

  has_secure_password

  before_save :default_values

  has_and_belongs_to_many :restaurants
  has_many :reservations

  validates :name, presence: true
  validates :authority, presence: true

  # validates_inclusion_of :authority, inclusion: [customer, authority]
  validates :name, :password, :email, presence: true
  validates :email, uniqueness: {message: "%{value} is already taken. Please enter a new email"}
  

  def default_values
    self.authority ||= 'customer'
  end

end
