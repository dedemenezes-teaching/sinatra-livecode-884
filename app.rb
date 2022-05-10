require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

# BASIC HTTP REQUEST STRUCTURE
# VERB + PATH

get "/" do
  # Retrieve all the restaurants
  @restaurants = Restaurant.all
  # ask the view to display
  erb :index
end

# get '/restaurants/2' do
#   "Hello World"
# end

# get '/restaurants/3' do
#   "Hello World"
# end

get '/restaurants/:id' do
  # params is a hash containing
  # all dynamic elements in your path as keys
  # e.g. :id
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)
  erb :show
end

post '/restaurants' do
  # [DEBUG] print the params hash in your view
  # params.to_s

  # params is a hash containing
  # all data received from your form
  # params keys will be the same as inputs name attribute
  name = params[:name]
  cuisine = params[:cuisine]
  address = params[:address]
  restaurant = Restaurant.new(name: name, cuisine: cuisine, address: address)
  restaurant.save

  redirect '/'
end
