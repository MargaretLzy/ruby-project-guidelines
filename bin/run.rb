require_relative '../config/environment'
require_relative '../app/user.rb'
require 'colorize'
# welcome user 
puts "Welcome to Rate Your Hospital!".blue
# let the user input their personal information 
puts "We're glad to help you today"

print "Please let us know your first name: "
first_name = STDIN.gets.chomp
print "and your last name: "
last_name= STDIN.gets.chomp

user = User.new(first_name, last_name)
user.welcome
