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
