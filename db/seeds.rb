# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroying car...'

Car.destroy_all

puts 'car destroyed !'

puts 'destroying user...'

User.destroy_all

puts 'user destroyed !'

puts 'Creating car...'

car_data = {
  price_per_day: 29.99,
  # type: "test",
  brand: 'Toyota',
  modele: 'Corolla',
  year: 1986,
  km: 30.000,
  status_disponibility: true,
  photo: 'https://source.unsplash.com/collection/190727/1600x900',
  description: 'une AE86 du tonnerre très connu pour le fameux anime Initial D',
  power: 45,
  type_of_carburator: 'fuel',
  number_of_place: 3,
  gear_lever: 'Manual'
}

car = Car.new(car_data)

puts 'car created !'

car.save

puts 'car saved !'

user_data = {
  first_name: 'Bilel',
  last_name: 'Ouri',
  phone_number: '443143413',
  email: 'b@gmail.com',
  birthday_date: '15/03/1990',
  password: 'password'
}

user = User.new(user_data)

puts 'user created !'

user.save

puts 'user saved !'

User.all.each do |user|
  puts "#{user.first_name} #{user.last_name} #{user.email}"
end

Car.all.each do |car|
  puts "#{car.brand} #{car.modele} #{car.year}"
end



