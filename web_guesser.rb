require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = guess_checker(guess)
  color = color
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message,
                          :color => color}
end

def guess_checker(guess)
  if (guess - SECRET_NUMBER) >= 6
    @color = "#ff0000"
    @message = "Way too high!"
  elsif (SECRET_NUMBER - guess) >= 6
    @color = "#ff0000"
    @message = "Way too low!"
  elsif (guess - SECRET_NUMBER) <= 5 && (guess - SECRET_NUMBER) > 0
    @color = "#cb3535"
    @message = "Too high!"
  elsif (SECRET_NUMBER - guess) <= 5 && (SECRET_NUMBER - guess) > 0
    @color = "#cb3535"
    @message = "Too low!"
  elsif guess == SECRET_NUMBER
    @message = "You got it right! The SECRET NUMBER was #{SECRET_NUMBER}!"
    @color = "#2bab25"
  else
    @message = "Incorrect entry, try again."
    @color = "#ff0000"
  end
end

