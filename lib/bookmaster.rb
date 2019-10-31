require_relative '../lib/book.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/scraper.rb'
require 'pry'

class Bookmaster

  attr_reader :books

  def initialize
    @cli = Cli.new
    @first_input = @cli.call
    @books = []
    ready_to_search?
    genre_choice
  end

  def ready_to_search?
    if @first_input == "y"
      supply_genres
    else
      puts "Too bad. See you later!"
    end
  end

  def supply_genres
    @genres = ["Best Fiction", "Best Fantasy", "Best Horror", "Best Nonfiction", "Best Science & Technology", "Best Food & Cookbooks", "Best Graphic Novels & Comics"]
    @genres.each.with_index(1) do |g, i|
    puts "#{i}. #{g}"
    #@genre = "#{g}"
    end
    @second_input = @cli.get_genre_choice
  end

  def genre_choice
    if @second_input == "1"
      page_url = "https://www.goodreads.com/choiceawards/best-fiction-books-2018"
    elsif @second_input == "2"
      page_url = "https://www.goodreads.com/choiceawards/best-fantasy-books-2018"
    #etc
    end
    create_books(page_url)
  end

  def create_books(page_url)
    data = Scraper.new.scrape(page_url)
    data.each do |data|
       upvotes = data.css("strong.result").text.gsub("\n", "")
       title = data.css("img").attr('alt').value
       url = data.css("a.pollAnswer__bookLink").attr('href').value
       @books << Book.new(title, upvotes, url)
     end
     display_books
   end

   def display_books
     @books.each.with_index(1) do |book, index|
     puts "#{index}. #{book.title} - #{book.upvotes} upvotes - https://www.goodreads.com#{book.url}"
   end
 end

end

Bookmaster.new


#does the heavy lifting. takes in info from other classes and initializes objects according to user input
