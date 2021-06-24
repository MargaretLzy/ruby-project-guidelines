class Review < ActiveRecord::Base
    belongs_to :hospital
    belongs_to :patient

    # reviews with the highest rating (= 5) in a particular state 
    def self.highest_rating(your_state)
        reviews_state = self.all.select { |review| review.hospital.state == your_state }
        reviews_state.max_by { |review| review.rating }
    end

    # reviews with the lowest rating (= 5) in a particular state 
    def self.lowest_rating(your_state)
        reviews_state = self.all.select { |review| review.hospital.state == your_state }
        reviews_state.min_by { |review| review.rating }
    end

    # the longest comments (limit 10)
    def self.longest_comment
        self.all.max_by { |review| review.comment.split.count } 
    end

    def self.id_to_name(hospital_id)
        # review_interst = self.all.select { |review| review.hospital_id == hospital_id } 
        hospitals = Hospital.all.select { |hospital| hospital.id == hospital_id }
        hospitals.map { |hospital| hospital.name }
    end
    def self.pid_to_name(patient_id)
        # review_interst = self.all.select { |review| review.hospital_id == hospital_id }
        patients = Patient.all.select { |patient| patient.id == patient_id }
        patients.map { |patient| patient.first_name }
    end
end