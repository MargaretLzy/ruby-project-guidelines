require_relative '../config/environment.rb'

Patient.destroy_all
Hospital.destroy_all
Review.destroy_all

10.times do
Patient.create(name:Faker::Name.name, budget: rand(1..100).to_f)
end