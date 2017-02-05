# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Categories
Category.create name: 'Beverages'
Category.create name: 'Deserts'
Category.create name: 'Appetizers'
Category.create name: 'Entrees'
Category.create name: 'Breakfast'
Category.create name: 'Sandwiches'

puts 'Created categories.'

User.create :username => "admin", :password => "password", :password_confirmation => "password"
puts 'Created users.'
