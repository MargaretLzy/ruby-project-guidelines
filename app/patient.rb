class Patient < ActiveRecord::Base
    has_many :reviews
    has_many :hospitals, through: :reviews 

    # the oldest patient

    # the patient with the most reviews 

    # the Patient age between 18 and 60 

    # the oldest male patient

    # the oldest female patient

end