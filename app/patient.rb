class Patient < ActiveRecord::Base
    has_many :reviews
    has_many :hospitals, through: :reviews 

    # the oldest patient
    ## perhaps need 20 olderst people on the list 
    def self.oldest_patient 
        self.all.max_by { |patient| patient.age } 
    end

    # the patient with the most reviews 

    # the Patient age between 18 and 60 

    # the oldest male patient

    # the oldest female patient

end