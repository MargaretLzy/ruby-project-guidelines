# Rate my Hospital
  Rate my hospital CLI application simulate a hospital app. You can sign in to check the hospital in your state, their rating and type. You can also review a hospital that you visit, delete or update your rating and comment afterwards.

# User Stories
As a patient
I want to be able to:
-Sign up by inputting personal information. (name, gender, age) (create a new patient instance - CREATE)
-Leave rating and comment about the hospital if he or she wishes. (CREATE)
-Change the ratings and comments after they submitted them in the system. (UPDATE) 
-View the reviews of a particular hospital that the patient is interested in. (rating, comment) (READ)
-Delete his rating, comment, or even own account. (DELETE)

# Install Instructions
1. Fork and clone this repository.
2. `cd` into the cloned folder and run in terminal
3. type `run bundle install`
4. `rake db:migrate`
5. `rake db:seed`
6. `ruby bin/run.rb`
7. Follow the instructions and have fun!
