require 'faker'

# Clean your database
puts "Cleaning DB"
Restaurant.destroy_all
# Populate your database

puts "Populating DB..."
5.times do |t|
  restaurant = Restaurant.new(name: "#{Faker::Fantasy::Tolkien.character}'s Restaurant",
                              cuisine: Faker::Restaurant.type,
                              address: Faker::Movies::StarWars.planet)
  restaurant.save
end

puts "#{Restaurant.count} restaurants created"
