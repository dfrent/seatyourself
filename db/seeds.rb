# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

omair = User.create(name: "Omair", email: "omair@gmail.com", password: "fakefakefake", authority: "customer")
pai = Restaurant.create(name: "Pai", location: "123 Duncan St.", capacity: 200, open: "11:00", close: "20:00")
