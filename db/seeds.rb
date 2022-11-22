# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy all data in database..."
Lesson.destroy_all
Booking.destroy_all
Host.destroy_all
User.destroy_all

puts "Creating a new database..."

host = User.create!(
  email: "host@lewagon.com",
  password: "lewagon",
  first_name: "host",
  last_name: "lewagon",
  phone_number: "07595096963",
  is_host: true
)

visitor = User.create!(
  email: "visitor@lewagon.com",
  password: "lewagon",
  first_name: "visitor",
  last_name: "lewagon",
  phone_number: "07595096963",
  is_host: false
)
