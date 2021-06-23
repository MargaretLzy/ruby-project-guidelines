require_relative '../config/environment.rb'
require 'csv'

Patient.destroy_all
puts "Initializing hospitals information ..."
Hospital.destroy_all
puts "Initializing reviews information ..."
Review.destroy_all
puts "Done initializing patients/hospitals/reviews information! Now uploading new information"

# PATIENT

state_data = CSV.read("state_data.csv", {encoding: "UTF-8", header_converters: :symbol, converters: :all})
city_data = CSV.read("city_data.csv", {encoding: "UTF-8", header_converters: :symbol, converters: :all})
state = state_data.map { |d| d.to_a.shift }
city = city_data.map{|d| d.to_a.shift}
10.times do
Patient.create(first_name:Faker::Name.male_first_name, last_name:Faker::Name.last_name, gender:"M", age: rand(1..100).to_f, state: state.sample, city: city.sample)
end
10.times do
Patient.create(first_name:Faker::Name.female_first_name, last_name:Faker::Name.last_name, gender:"F", age: rand(1..100).to_f, state: state.sample, city: city.sample)

end
puts "Done creating patients!"


#all csv data
#CSV.foreach("hospital_data.csv", {encoding: "UTF-8", headers: true, #header_converters: :symbol, converters: :all}) do |row|
 # Hospital.create(row.to_hash)
#end

#select random data

# HOSPITAL
data = CSV.read("hospital_data.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})

hashed_data = data.map { |d| d.to_hash }

10.times do
  Hospital.create(hashed_data.sample)
end

# REVIEW 
puts "Done creating Hospitals!"
30.times do
  Review.create(patient_id: Patient.all.sample.id, hospital_id: Hospital.all.sample.id, rating: rand(0..5).to_f, comment:Faker::Quotes::Chiquito.sentence )
end
