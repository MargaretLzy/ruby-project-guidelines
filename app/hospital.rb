class Hospital < ActiveRecord::Base
    has_many :reviews 
    has_many :patients, through: :reviews 

    # average rating of a particular hospital 

    # all the hospitals in your state 

    # all the hospital in your city (if there is)

    # highest ratting as government hospital -> return hospital as object 

    # highest ratting as private hospital -> return hospital as object 

end