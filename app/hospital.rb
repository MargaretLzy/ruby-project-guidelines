class Hospital < ActiveRecord::Base
    has_many :reviews 
    has_many :patients, through: :reviews 
end