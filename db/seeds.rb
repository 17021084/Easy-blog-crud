# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
# ! means except it raises an exception
User.create!(name: 'Example User',
             email: 'trung123@gmail.com',
             password: '12345678',
             password_confirmation: '12345678',
             admin: true)
# Generate a bunch of additional users.

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  password = '12345678'
  User.create(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    admin: false
  )
end
