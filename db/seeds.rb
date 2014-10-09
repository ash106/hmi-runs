# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

user = User.create!(name: 'Susan', email: 'user@example.com', password: 'changeme')
user.runs.create!(date_of: "2014-08-28", distance: 2)
user.runs.create!(date_of: "2014-08-30", distance: 2.5)
user.runs.create!(date_of: "2014-09-01", distance: 3.7)
user.workouts.create!(date_of: "2014-08-28", length: 15)
user.workouts.create!(date_of: "2014-08-30", length: 20)
user.workouts.create!(date_of: "2014-09-01", length: 25)

user = User.create!(name: 'Tester', email: 'tester@example.com', password: 'changeme')
user.runs.create!(date_of: "2014-08-30", distance: 2.5)
user.runs.create!(date_of: "2014-08-31", distance: 2)
user.runs.create!(date_of: "2014-09-01", distance: 3.4)
user.workouts.create!(date_of: "2014-08-28", length: 5)
user.workouts.create!(date_of: "2014-08-30", length: 10)
user.workouts.create!(date_of: "2014-09-01", length: 20)
