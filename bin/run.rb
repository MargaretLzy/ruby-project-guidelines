require_relative '../config/environment'
require_relative '../app/user.rb'
require 'colorize'
# welcome user 
puts "Welcome to Rate Your Hospital!".blue
# let the user input their personal information 
puts "We're glad to help you today"

User.welcome

