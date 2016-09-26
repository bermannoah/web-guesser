require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = guess_checker(guess)
  number_reveal = " "
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def guess_checker(guess)
  if (guess - SECRET_NUMBER) >= 6
    message = "Way too high!"
  elsif (SECRET_NUMBER - guess) >= 6
    message = "Way too low!"
  elsif (guess - SECRET_NUMBER) <= 5 && (guess - SECRET_NUMBER) > 0
    message = "Too high!"
  elsif (SECRET_NUMBER - guess) <= 5 && (SECRET_NUMBER - guess) > 0
    message = "Too low!"
  elsif guess == SECRET_NUMBER
    message = "You got it right! The SECRET NUMBER was #{SECRET_NUMBER}!"
  else
    message = "Incorrect entry, try again."
  end
end

