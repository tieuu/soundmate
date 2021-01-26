# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting stuff"
Equipment.destroy_all
User.destroy_all
puts "adding stuff"

User.create!(
  email: "dan@gmail.com",
  name: "dan",
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate1"
)

User.create!(
  email: "julian@gmail.com",
  name: "julian",
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate2"
)

User.create!(
  email: "tieu@gmail.com",
  name: "tieu",
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate3"
)

User.create!(
  email: "vincent@gmail.com",
  name: "vincent",
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  password: "soundmate4"
)

User.all.each do |user|
  2.times do (
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
