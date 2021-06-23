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
   # puts "#{self.menu}"
  end
end
  # let the user to write comment(s)/ratings for hospital(s) that they went 
  # let the user to edit / delect their comments and ratings 

# let the user to find hospital he or she wants 