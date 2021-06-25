class User
 def self.welcome
 print "Please let us know your first name: "
first= STDIN.gets.chomp
print "and your last name: "
last= STDIN.gets.chomp

@@user = Patient.find_or_create_by(first_name: first, last_name: last)
  print "Hi "
    print "#{first.capitalize}".cyan
    print "!"
    puts " What would you like to do today"
    puts "#{self.menu}"
  end
  def self.menu
    while true do
    puts "1. Write Comments/Rate a Hospital"
    puts "2. Browse by State"
    puts "3. Retrieve All My Reviews"
    puts "4. Modify Comment/Rate for a Hospital"
    puts "5. Exit".red
    print "Please Select a Number, or Type exit. "
    input = STDIN.gets.chomp
    
    if input.downcase == 'exit' ||input =="5"
      break
    end
    
    case input.downcase
    when "1"
      self.write
      when "2"
        self.browse
        when "3"
          self.check
          when "4"
            self.update
    else
      puts "The number you entered is invalid. Please try again."
    end
end
end
# let the user to write comment(s)/ratings for hospital(s) that they went 
  def  self.write
     user_id=@@user.id
    print "What is the name of the hospital you'd like to rate: "
    input = STDIN.gets.chomp
    while input != 'return' do
      hos =Hospital.find_or_create_by(name: input)
        print "Please enter the rating for this hospital(0-10): "
        new_rating= STDIN.gets.chomp
    
       print "Would like to add a comment: "
       new_comment= STDIN.gets.chomp
       puts "You give a rating of #{new_rating} for #{input}".green
       puts "We appreciate your review!"
       Review.create(patient_id: user_id, hospital_id: hos.id, rating: new_rating, comment: new_comment)
        puts "What would you like to do next?"
        break
end
end
# let the user to find hospital he or she wants 
def self.browse
  print "Which state do you live in: "
  state_input=  STDIN.gets.chomp
 allhos= Hospital.state(state_input)  
 hos_name= allhos.map{|hos|hos.name}
  puts hos_name
  puts "Listed above are the hospital in your state".magenta
  print "Which hospital are you interested in: "
  hos1= STDIN.gets.chomp
  get_id= Hospital.find_by(name: hos1)
   hos_type= get_id.hospital_type
   hos_city=get_id.city
   hos_id = get_id.id
   review_data= Review.find_by(hospital_id: hos_id)
   hos_rating=get_id.average_rating
   hos_comment =review_data.comment
   puts "#{hos1} is a #{hos_type} type hospital located in #{hos_city} with average rating of #{hos_rating} out of 10. Some comments include #{hos_comment}. ".yellow
  
end

def self.check
  user_id=@@user.id
  user_review= Review.where(patient_id: user_id)
  #allrev= user_review.map{|rev|rev.rating}
  #allid=user_review.map{|rev|rev.hospital}
  
  #allcomment =user_review.map{|rev|rev.comment}
  user_review.map { |review| puts "For #{review.hospital.name}, you rated #{review.rating},and commented #{review.comment}".yellow }
  #puts "For the hospital id#{allid}, you rated #{allrev},and commented #{allcomment}".yellow

   puts "Here are the hospitals you rated"
     # let the user to edit / delect their comments and ratings 
    puts "Do you want to delete your reviews:"
    while true do
    puts "y. Delete all reviews"
    puts "n. Exit".red
    print "Please choose the option "
    input = STDIN.gets.chomp
    
    if input.downcase == 'exit' ||input =="n"
      break
    end
    
    case input.downcase
    when "y"
      user_review.destroy_all
      puts "All reviews deleted".magenta
      break
    else
      puts "The key you enter is invalid, please try again."
    end
end

end

def self.update
 print "What is the name of the hospital you'd like to update your rating: "
    input = STDIN.gets.chomp
    while input != 'return' do
      if Hospital.find_by(name: input)==nil
          print "Sorry you don't have rating for this hospital yet"
        else 
          hospital =Hospital.find_by(name: input)
          print  
            user_id=@@user.id
  user_rev= Review.find_by(patient_id: user_id, hospital_id: hospital.id)
   user_rating= user_rev.rating
   user_comment=user_rev.comment
   review_hos= user_rev.hospital_id
   #try to get hospital name from hospital_id
 #  get_hosp = review_hos.name
  # hosp_name= get_hosp.name
  rev= Review.find_by(patient_id: user_id, hospital_id: review_hos)
  puts "For Hospital #{input}, you rated #{user_rating},and commented #{user_comment}".yellow
  puts "What would you like to update"
   
    while true do
    puts "1. Update rating"
    puts "2. Update comment"
    puts "n. Exit".red
    print "Please choose an option "
    input = STDIN.gets.chomp
    
    if input.downcase == 'exit' ||input =="n"
      break
    end
    
    case input.downcase
    when "1"
       print "Please enter the rating for this hospital(0-10): "
        new_rating= STDIN.gets.chomp
      rev.update(rating: new_rating)
      puts "You updated your rating from  #{user_rating} to #{new_rating}".green
      when "2"
      print "Please enter the comment for this hospital: "
        new_comment= STDIN.gets.chomp
      rev.update(comment: new_comment)
     puts "You updated your comment from #{user_comment} to #{new_comment}".yellow
    else
      puts "The key you enter is invalid, please try again."
    end
end

end
 

   puts "Here are the hospital you rated"
        puts "What would you like to do next?"
        break
end
end
end
