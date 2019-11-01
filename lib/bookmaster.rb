require_relative '../lib/book.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/scraper.rb'
require 'pry'

class Bookmaster

  attr_reader :books

  def initialize
    @cli = Cli.new
    #@first_input = @cli.call
    @books = []
    ready_to_search?
    genre_choice
  end

  def ready_to_search?
    @first_input = @cli.call
    if @first_input == "y"
      supply_genres
    else 
      puts "Too bad. See you later!"
      exit
    end
  end

  def supply_genres
    @genres = ["Best Fiction", "Best Fantasy", "Best Horror", "Best Nonfiction", "Best Science & Technology", "Best Food & Cookbooks", "Best Graphic Novels & Comics"]
    @genres.each.with_index(1) do |g, i|
    puts "#{i}. #{g}"
    end
    @second_input = @cli.get_genre_choice
  end

  def genre_choice
    if @second_input == "1"
      page_url = "https://www.goodreads.com/choiceawards/best-fiction-books-2018"
    elsif @second_input == "2"
      page_url = "https://www.goodreads.com/choiceawards/best-fantasy-books-2018"
    elsif @second_input == "3"
      page_url = "https://www.goodreads.com/choiceawards/best-horror-books-2018"
    elsif @second_input == "4"
      page_url = "https://www.goodreads.com/choiceawards/best-nonfiction-books-2018"
    elsif @second_input == "5"
      page_url = "https://www.goodreads.com/choiceawards/best-science-technology-books-2018"
    elsif @second_input == "6"
      page_url = "https://www.goodreads.com/choiceawards/best-food-cookbooks-2018"
    elsif @second_input == "7"
      page_url = "https://www.goodreads.com/choiceawards/best-graphic-novels-comics-2018"
    elsif @second_input == "exit"
      exit
    elsif @second_input == "genres"
      supply_genres
    else
      puts "Try again!" #not working
      ready_to_search?
    end
    create_books(page_url)
  end

  def create_books(page_url)
    data = Scraper.new.scrape(page_url)
    data.each do |data|
       upvotes = data.css("strong.result").text.gsub("\n", "").chomp("votes")
       title = data.css("img").attr('alt').value
       url = data.css("a.pollAnswer__bookLink").attr('href').value
       @books << Book.new(title, upvotes, url)
     end
     display_books
   end

   def display_books
     @books.each.with_index(1) do |book, index|
     puts "#{index}. #{book.title} - #{book.upvotes} upvotes - URL: https://www.goodreads.com#{book.url}"
     #color code these outputs (ie blue underlined urls)
     end
     end_or_repeat
   end

   def end_or_repeat
      @third_input = Cli.new.get_final_choice
      if @third_input == "exit"
        exit
      elsif @third_input == "genres"
        ready_to_search?
    end
   end

end

Bookmaster.new


#does the heavy lifting. takes in info from other classes and initializes objects according to user input
