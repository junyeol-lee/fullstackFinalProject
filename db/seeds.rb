# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end

Province.destroy_all
OrderProduct.destroy_all
Product.destroy_all
Order.destroy_all
Category.destroy_all
User.destroy_all

list_Of_Province = ['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland and Labrador', 'Northwest Territories', 'Nova Scotia', 'Nunavut', 'Ontario', 'Prince Edward Lsland', 'Quebec', 'Saskatchewan', 'Yukon']
important_organs = %w[Heart Eyeball Lung]
less_importan_organs = %w[Liver Pancreas kidney]
categories = %w[important_organs less_importan_organs]
list_of_status = ['Sale', 'New', 'Sold out', 'Defected', 'Shit']

list_Of_Province.each do |province|
  Province.create(
    province: province
  )
end

categories.each do |category|
  current_category = Category.create(
    name: category,
    description: Faker::Quote.famous_last_words
  )

  if category == 'important_organs'
    important_organs.each do |organ|
      Product.create(
        category: current_category,
        name: organ,
        description: Faker::Hacker.say_something_smart,
        cost_cents: rand(100_000..1_000_000),
        product_status: list_of_status[rand(0..4)]
      )
    end
end
  next unless category == 'less_importan_organs'

  less_importan_organs.each do |organ|
    Product.create(
      category: current_category,
      name: organ,
      description: Faker::Hacker.say_something_smart,
      cost_cents: rand(50_000..100_000),
      product_status: list_of_status[rand(0..4)]
    )
  end
end

10.times do |_item|
  User.create!(
    email: Faker::Internet.unique.email,
    encrypted_password: '123456',
    name: Faker::Name.unique.name,
    address: Faker::Address.unique.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    province: Province.order('RANDOM()').first,
    password: '123456'
  )
end

puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."
puts "Created #{User.count} users."
