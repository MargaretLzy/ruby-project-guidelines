class Hospital < ActiveRecord::Base
    has_many :reviews 
    has_many :patients, through: :reviews 

    # average rating of a particular hospital 
    def reviews 
        Review.all.select { |review| review.hospital_id == self.id }
    end

    def average_rating
        ratings = reviews.map { |review| review.rating }
        total = ratings.reduce(0) { |sum, rating| sum + rating }
        total / ratings.length 
    end

    # all the hospitals in your state 
    def self.state(your_state_here)  
        self.all.select { |hospital| hospital.state == your_state_here }
    end


    # all the hospital in your city (if there is)
    ## return "We do not have hospital(s) registered in your city."
    ## return "Be the first one to review your hospital!"
    def self.city(your_city_here)  
        self.all.select { |hospital| hospital.state == your_city_here }
    end


    # highest ratting as government hospital -> return hospital as object 
    def self.best_government_hospitals
        #binding.pry
        government_hospitals = self.all.select { |hospital| hospital.hospital_type == "Government" }
        binding.pry
        reviews_government_hospitals = Review.all.select {|review| government_hospitals.include?(review.hospital)}
        reviews_government_hospitals.max_by { |review| review.rating }
    end

    # highest ratting as private hospital -> return hospital as object 
    def self.best_private_hospitals
        #binding.pry
        private_hospitals = self.all.select { |hospital| hospital.hospital_type == "Private" }
        binding.pry
        reviews_private_hospitals = Review.all.select {|review| private_hospitals.include?(review.hospital)}
        SELECT reviews_private_hospitals FROM reviews 
    end


end