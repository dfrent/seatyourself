# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # Resetter
User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all
FoodItem.destroy_all

# # Users
omair = User.create(name: "Omair", email: "omair@gmail.com", password: "123")
james = User.create(name: "James", email: "jim@gmail.com", password: "123")
cordell = User.create(name: "Cordell", email: "gbd@gmail.com", password: "123")
kyle = User.create(name: "Kyle", email: "kal@gmail.com", password: "123")

# # Restaurants
day_start = Time.now.beginning_of_day
pai = Restaurant.create(name: "Pai", location: "123 Duncan St.", capacity: 200, open_time: day_start + 8.hours, close_time: day_start + 20.hours, max_reservation_size: 5) #image_url: "https://picsum.photos/200")
bar_isabel = Restaurant.create(name: "Bar Isabel", location: "796 College West", capacity: 150, open_time: day_start + 16.hours, close_time: day_start + 24.hours, max_reservation_size: 5)#, image_url: "https://picsum.photos/200")
electric_mud = Restaurant.create(name: "Electric Mud", location: "5 Brock Street", capacity: 60, open_time: day_start + 17.hours, close_time: day_start + 23.hours, max_reservation_size: 5)#, image_url: "https://picsum.photos/200")

# # Reservations
pai_reservation = Reservation.create(restaurant_id: pai.id, user_id: omair.id, size: 2, date: Time.new(2017, 12, 22, 13, 30, 00, "-05:00"))

isabel_reservation = Reservation.create(restaurant_id: bar_isabel.id, user_id: james.id, size: 2, date: Time.new(2017, 12, 30, 20, 30, 00, "-05:00"))

mud_reservation = Reservation.create(restaurant_id: electric_mud.id, user_id: cordell.id, size: 2, date: Time.new(2017, 12, 14, 13, 30, 00, "-05:00"))

# # Food Items
fries = FoodItem.create(restaurant_id: pai.id, name: "Fries", food_type: "appetizer", price: 3.99, description: "Salted, deep friend potato wedges.")

hamburger = FoodItem.create(restaurant_id: pai.id, name: "Hamburger", food_type: "entree", price: 8.99, description: "Beef patty, lettuce, tomato, and cheese in a bun.")

cola = FoodItem.create(restaurant_id: pai.id, name: "Cola", food_type: "drink", price: 1.99, description: "Carbonated sweet beverage.")

salad = FoodItem.create(restaurant_id: pai.id, name: "Salad", food_type: "side", price: 3.99, description: "Assorted vegetables in  a bowl.")
fries = FoodItem.create(restaurant_id: bar_isabel.id, name: "Fries", food_type: "appetizer", price: 3.99, description: "Salted, deep friend potato wedges.")

hamburger = FoodItem.create(restaurant_id: bar_isabel.id, name: "Hamburger", food_type: "entree", price: 8.99, description: "Beef patty, lettuce, tomato, and cheese in a bun.")

cola = FoodItem.create(restaurant_id: bar_isabel.id, name: "Cola", food_type: "drink", price: 1.99, description: "Carbonated sweet beverage.")

salad = FoodItem.create(restaurant_id: bar_isabel.id, name: "Salad", food_type: "side", price: 3.99, description: "Assorted vegetables in  a bowl.")
fries = FoodItem.create(restaurant_id: electric_mud.id, name: "Fries", food_type: "appetizer", price: 3.99, description: "Salted, deep friend potato wedges.")

hamburger = FoodItem.create(restaurant_id: electric_mud.id, name: "Hamburger", food_type: "entree", price: 8.99, description: "Beef patty, lettuce, tomato, and cheese in a bun.")

cola = FoodItem.create(restaurant_id: electric_mud.id, name: "Cola", food_type: "drink", price: 1.99, description: "Carbonated sweet beverage.")

salad = FoodItem.create(restaurant_id: electric_mud.id, name: "Salad", food_type: "side", price: 3.99, description: "Assorted vegetables in  a bowl.")
