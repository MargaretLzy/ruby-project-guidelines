class User
  attr_reader :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name =first_name
    @last_name =last_name
    
  end
  def welcome
    print "Hi "
    print "#{@first_name.capitalize}".cyan
    print "!"
    puts "What would you like to do today"
    puts "#{self.menu}"
  end
  def menu
    while true do
    puts "1. Write comments/Rate a hospital"
    puts "2. Browse by State"
    puts "3. Check rating for a hospital"
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
  def write
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
        new_hospital= Hospital.find_or_create_by(name: input)
        puts "What would you like to do next?"
        break
end
end
# let the user to find hospital he or she wants 
def browse
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
   puts "#{hos1} is a #{hos_type} type hospital located in #{hos_city} with average rating of #{hos_rating} out of 10. Some comments include #{hos_comment}. "
end

def check
    print "What is the name of the hospital you'd like to see the review: "
    hos_name = STDIN.gets.chomp
     if Hospital.find_by(name: hos_name) == nil
          puts "Sorry, there's no review for this hospital yet.".red
      else
    get_id= Hospital.find_by(name: hos_name)
    hos_id = get_id.id
    review_data= Review.find_by(hospital_id: hos_id)
    hos_rating=get_id.average_rating
   hos_comment =review_data.comment
   puts "#{hos_name} has an average rating of #{hos_rating}. Some comments include #{hos_comment}. "
end
end
end
  # let the user to edit / delect their comments and ratings 
