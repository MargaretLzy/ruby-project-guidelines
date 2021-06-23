class Review < ActiveRecord::Base
    belongs_to :hospital
    belongs_to :patient

    # reviews with the highest rating (= 5) in a particular state 

    # reviews with the lowest rating (= 5) in a particular state 

    # the longest comments (limit 10)

    # hospital with the most reviewed 

    # hospital that you reviewed 

end