class Cli

  def self.call
    puts "\nWelcome to the Bookfinder 2000! With this app, you'll be able to find a great read that is custom-tailored to your preferences. Ready to search? (y/n)\n"
    input = gets.strip
  end
  #JUST puts and gets information


  def self.get_user_genre_choice
      puts "\nEnter the number of the genre you'd like more info on or type list to see the genres again or type exit:\n"
        chosen_genre = gets.strip
    end

end
