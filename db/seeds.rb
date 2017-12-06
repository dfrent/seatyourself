# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

omair = User.create(name: "Omair", email: "omair@gmail.com", password: "fakefakefake", authority: "customer")
pai = Restaurant.create(name: "Pai", location: "123 Duncan St.", capacity: 200, open_time: "11:00", close_time: "20:00", max_reservation_size: 5), #image_url: "https://picsum.photos/200")
bar isabel = Restaurant.create(name: "Bar Isabel", location: "796 college west.", capacity: 150, open_time: "16:00", close_time: "24:00", max_reservation_size: 5)#, image_url: "https://picsum.photos/200")
