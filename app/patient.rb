class Patient < ActiveRecord::Base
    has_many :reviews
    has_many :hospitals, through: :reviews 
end