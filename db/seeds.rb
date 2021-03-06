# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting stuff"

Booking.destroy_all
Equipment.destroy_all
User.destroy_all

puts "adding users"

User.create!(
  email: "dan@gmail.com",
  name: "dan",
  address: "2-11-3 Meguro, Tokyo",
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate1"
)

User.create!(
  email: "julian@gmail.com",
  name: "julian",
  address: "Haneda Airport, Ota City, Tokyo",
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate2"
)

User.create!(
  email: "tieu@gmail.com",
  name: "tieu",
  address: "6-3-9 Akasaka, Minato City, Tokyo",
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate3"
)

User.create!(
  email: "vincent@gmail.com",
  name: "vincent",
  address: "3 Chome-1-1 Benten, Chuo Ward, Chiba",
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate4"
)

puts "adding Equipment"

User.all.each do |user|
  4.times do (
    Equipment.create!(
      description: Faker::Lorem.paragraph(sentence_count: 3),
      ad_name: Faker::Lorem.sentence,
      category: Equipment::CATEGORY.sample,
      price: rand(10_000.00..100_000.00).round(2),
      active: true,
      user_id: user.id
    ))
  end
end

puts "done"
