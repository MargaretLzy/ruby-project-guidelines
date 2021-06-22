require_relative '../config/environment.rb'
require 'csv'

hospital_table = CSV.parse(File.read("hospital_data.csv"), headers: true)
hospital_name=hospital_table[0]
city_data= hospital_table[1]
state_data=hospital_table[2]
hospital_type=hospital_table[3]

Patient.destroy_all
Hospital.destroy_all
Review.destroy_all

10.times do
Patient.create(first_name:Faker::Name.male_first_name, last_name:Faker::Name.last_name, gender:"M", age: rand(1..100).to_f,state: state_data.sample, city: city_data.sample)
end
10.times do
Patient.create(first_name:Faker::Name.female_first_name, last_name:Faker::Name.last_name, gender:"F", age: rand(1..100).to_f,state: state_data.sample, city: city_data.sample)
end
puts "Done creating patient!"
