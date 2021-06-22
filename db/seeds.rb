require_relative '../config/environment.rb'
require 'csv'

#hospital_table = CSV.parse(File.read("hospital_data.csv"), headers: true)
#hospital_name=hospital_table[0]
#city_data= hospital_table[1]
#state_data=hospital_table[2]
#hospital_type=hospital_table[3]

#data = CSV.read("hospital_data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

#hashed_data = data.map { |d| d.to_hash }

Patient.destroy_all
Hospital.destroy_all
Review.destroy_all

10.times do
Patient.create(first_name:Faker::Name.male_first_name, last_name:Faker::Name.last_name, gender:"M", age: rand(1..100).to_f)
end
10.times do
Patient.create(first_name:Faker::Name.female_first_name, last_name:Faker::Name.last_name, gender:"F", age: rand(1..100).to_f)
end
puts "Done creating patient!"

#all csv data
#CSV.foreach("hospital_data.csv", {encoding: "UTF-8", headers: true, #header_converters: :symbol, converters: :all}) do |row|
 # Hospital.create(row.to_hash)
#end

#select random data
data = CSV.read("hospital_data.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = data.map { |d| d.to_hash }

10.times do
  Hospital.create(hashed_data.sample)
end
