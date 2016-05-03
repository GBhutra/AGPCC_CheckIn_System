# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Event.create!(title: "Current Event", description: "This is an on going Event", venue: "WCL, Texas A&M University, College Station, Texas,...", created_at: "2016-04-12 01:44:14", updated_at: "2016-04-12 01:44:14", longitude: -96.3579087, latitude: 30.5894709, start_time: "2016-04-11 20:00:00", end_time: "2017-04-11 18:00:00") 
Event.create!(title: "Future Event", description: "This is a future Event", venue: "HRBB, College Station, TX", created_at: "2016-04-12 01:46:43", updated_at: "2016-04-12 01:59:57", longitude: -96.3387678, latitude: 30.6189722, start_time: "2017-04-11 10:00:00", end_time: "2017-04-13 08:00:00")