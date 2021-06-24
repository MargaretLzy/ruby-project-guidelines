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
    puts "What would you like to do today"
    puts "#{self.menu}"
  end
  def self.menu
    while true do
    puts "1. Write comments/Rate a hospital"
    puts "2. Browse by State"
    puts "3. Retrieve all my reviews"
    puts "4. Modify comment/rate for a hospital"
    puts "5. Exit".red
    print "Please select a number, or type Exit. "
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
    else
      puts "The number you enter is invalid, please try again."
    end
end
end
# let the user to write comment(s)/ratings for hospital(s) that they went 
  def  self.write
    print "What is the name of the hospital you'd like to rate: "
    input = STDIN.gets.chomp
    while input != 'return' do
    
          print "Please enter the rating for this hospital(0-10): "
        new_rating= STDIN.gets.chomp
       # Review.create(hospital_id: hos.id, rating: new_rating)
       print "Would like to add a comment: "
       new_comment= STDIN.gets.chomp
       puts "You give a rating of #{new_rating} for #{input}"
       puts "We appreciate your review"
       # new_hospital= Hospital.find_or_create_by(name: input)
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
  puts "Listed above are the Hospital in your state".magenta
  print "Which Hospital are you interested in: "
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
  allrev= user_review.map{|rev|rev.rating}
  allid=user_review.map{|rev|rev.hospital_id}
  
  allcomment =user_review.map{|rev|rev.comment}
  puts "For Hospital id#{allid}, you rated #{allrev},and commented #{allcomment}".yellow

   puts "Here are the hospital you rated"
    puts "Do you want to delete your reviews:"
    while true do
    puts "y. Delete all review"
    puts "o. See the name of the hospital"
    puts "n. Exit".red
    print "Please choose an option "
    input = STDIN.gets.chomp
    
    if input.downcase == 'exit' ||input =="n"
      break
    end
    
    case input.downcase
    when "y"
      user_review.destroy_all
      when "o"
       print "Please enter the hospital ID: "
       idnum= STDIN.gets.chomp
       name= Review.id_to_name(idnum)
      puts "You rated for #{name}."
    else
      puts "The key you enter is invalid, please try again."
    end
end

end
end
  # let the user to edit / delect their comments and ratings 
