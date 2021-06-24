class Hospital < ActiveRecord::Base
    has_many :reviews 
    has_many :patients, through: :reviews 

    # average rating of a particular hospital 
    def average_rating
        ratings = reviews.map { |review| review.rating }
        total = ratings.reduce(0) { |sum, rating| sum + rating }
        total / ratings.length 
    end

    # all the hospitals in your state 
    def self.state(your_state)  
        self.all.select { |hospital| hospital.state == your_state }
    end


    # all the hospital in your city (if there is)
    ## return "We do not have hospital(s) registered in your city."
    ## return "Be the first one to review your hospital!"
    def self.city(your_city)  
        self.all.select { |hospital| hospital.city == your_city }
    end


    # 10 highest rating as government hospital -> return hospital as object 
    def self.best_government_hospitals
        reviews_government_hospitals = Review.all.select {|review| review.hospital.hospital_type == "Government" }
        sorted_reviews = reviews_government_hospitals.sort_by { |review| review.rating }.reverse
        sorted_reviews[0,9]
    end

    # 10 highest ratting as private hospital -> return hospital as object 
    def self.best_private_hospitals
        reviews_private_hospitals = Review.all.select {|review| review.hospital.hospital_type == "Private" }
        sorted_reviews = reviews_private_hospitals.sort_by { |review| review.rating }.reverse
        sorted_reviews[0,9]
    end

    # hospital with the most reviewed 
    ## How many reviews it had? 
    def self.most_reviewed
        self.all.max_by { |hospital| hospital.reviews.length }
    end

end