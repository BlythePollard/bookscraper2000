class Cli

  def call
    puts "\nWelcome to the Bookfinder 2000! With this app, you'll be able to find a great Best of 2018 read that is custom-tailored to your preferences. Ready to search? (y/n)\n"
    input = gets.strip
  end

  def get_genre_choice
      puts "\nWhich genre's Best of 2018 books would you like to see? Enter the genre's number or type exit:\n"
        gets.strip
    end

  def get_final_choice
    puts "\nDid you find what you were looking for? If so, type exit. To search again, type genres:\n"
    gets.strip
  end

end

#JUST puts and gets information
