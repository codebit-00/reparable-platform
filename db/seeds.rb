# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Device.destroy_all
User.destroy_all
ReparationRequest.destroy_all
Store.destroy_all

# Create 47 devices sorted in alphabetical order
puts "Start seeding devices"
  devices = ["Air Conditioner", "Air Purifier", "Blender", "Bread Machine", "Built-in Dishwasher", "Ceiling Fan", "Coffee Grinder", "Coffee Maker", 
             "Deep Fryer", "Dehumidifier", "Domestic Robot", "Dryer", "Food Dehydrator", "Food Processor", "Freezer", "Garbage Disposal", "Generator", 
             "Home theater", "Hood Smoke Extractor", "Humidifier", "Ice Cream Maker", "Instant Pot", "Iron", "Juicer", "Microwave", "Mobile phone",
             "Oven", "Panini Maker", "Popcorn Machine", "Portable Dishwasher", "Refrigerator", "Rice Cooker", "Sewing Machine", "Slow Cooker", "Smart TV", 
             "Smoker", "Space Heater", "Stand Mixer", "Steam Cleaner", "Toaster", "Toaster Oven", "Vacuum", "Waffle Iron", "Washing Machine", 
             "Water Heater", "Water Purifier", "Yogurt Maker"]
  devices.each do |device|
    Device.find_or_create_by({name: device})
  end 
puts "End seeding devices"

# Create 10 stores
puts "Start seeding stores"
devices = Device.all
10.times do
  priority = Faker::Number.unique.between(from: 1, to: 10)
  address = Faker::Address.unique.street_address
  store_data = {
    priority: priority,
    address: address
  }
  Store.find_or_create_by(store_data).devices << devices.sample(30)
end
puts "End seeding stores"

# Create 10 users
puts "Start seeding users"
  stores = Store.all
  stores.each do |store|
    name = Faker::Name.unique.name
    email = "user#{store.priority}@mail.com"
    password = "123456"
    user_data = {
      store: store,
      name: name,
      email: email,
      password: password
    }
    User.create(user_data)
  end
puts "End seeding users"

# Create 10 Reparation request for the store with priority 1
puts "Start seeding reparation requests"
10.times do
  store_id = Store.find_by(priority: 1).id
  device = Store.find_by(priority: 1).devices.map{|device| device.id}.sample
  purchase_installation_date = Faker::Date.between(from: 1.year.ago, to: Date.today)
  issue_description = Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false)
  model_number = Faker::Code.nric
  requester_zip_code = Faker::Address.zip_code
  requester_address = Faker::Address.street_address
  requester_first_name = Faker::Name.unique.first_name
  requester_last_name = Faker::Name.unique.last_name
  requester_email = Faker::Internet.unique.email
  requester_telephone = Faker::PhoneNumber.cell_phone_in_e164.gsub('+','')
  requester_country = "EE.UU"
  requester_state = Faker::Address.state
  requester_city = Faker::Address.city
  reparation_request_data = {
    store_id: store_id,
    device: device,
    purchase_installation_date: purchase_installation_date,
    issue_description: issue_description,
    model_number: model_number,
    requester_zip_code: requester_zip_code,
    requester_address: requester_address,
    requester_first_name: requester_first_name,
    requester_last_name: requester_last_name,
    requester_email: requester_email,
    requester_telephone: requester_telephone,
    requester_country: requester_country,
    requester_state: requester_state,
    requester_city: requester_city,
  }
  ReparationRequest.find_or_create_by(reparation_request_data)
end
puts "End seeding reparation requests"