# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Event.create!(title: "New Event _4", description: "This is new event #4", venue: "College Station", ticket_price: "5$", created_at: "2016-04-09 21:09:56", updated_at: "2016-04-09 21:09:56", start_time: "2000-01-01 15:14:00", end_time: "2000-01-01 18:00:00", longitude: -96.3344068, latitude: 30.627977)