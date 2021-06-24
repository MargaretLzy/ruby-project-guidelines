class Patient < ActiveRecord::Base
    has_many :reviews
    has_many :hospitals, through: :reviews 

    # 10 oldest patient
    def self.oldest 
        sorted_patients = self.all.sort_by { |patient| patient.age }.reverse
        sorted_patients[0, 9]
    end

    # 10 patient with the most reviews
    ## Hw many reviews each person wrote??? 
    def self.most_reviews
        sorted_patients = self.all.sort_by { |patient| patient.reviews.length }.reverse
        sorted_patients[0, 9]
    end

    # Number of patients age between 18 and 60 
    def self.age_range
        top_limit = self.where("age <= 60")
        bottom_limit = top_limit.where("age >=18")
        bottom_limit.length
    end

    # Top 10 oldest male patient
    def self.male_oldest
        male_patients = self.select { |patient| patient.gender == "M" }
        sorted_males = male_patients.sort_by { |patient| patient.age }.reverse
        sorted_males[0, 9] 
    end

    # Top 10 oldest female patient
    def self.female_oldest
        female_patients = self.select { |patient| patient.gender == "F" }
        sorted_females = female_patients.sort_by { |patient| patient.age }.reverse
        sorted_females[0, 9] 
    end

end