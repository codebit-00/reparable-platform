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
