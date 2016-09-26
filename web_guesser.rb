require 'sinatra'
require 'sinatra/reloader'

num_to_display = rand(0..100)

get '/' do
  "The SECRET NUMBER is #{num_to_display}"
end