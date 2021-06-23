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
    else
      puts "The number you enter is invalid, please try again."
    end
end
end
  
  def write
    print "What is the name of the hospital you'd like to rate"
    input = STDIN.gets.chomp
    while input != 'return' do
     hos= Hospital.find_or_create_by(name: input)
          print "Please enter the rating for this hospital(0-10): "
        new_rating= STDIN.gets.chomp
        Review.create(hospital_id: hos.id, rating: new_rating)
       
        puts "What would you like to do next?"
        break
end
end
end
  # let the user to write comment(s)/ratings for hospital(s) that they went 
  # let the user to edit / delect their comments and ratings 

# let the user to find hospital he or she wants 