class Bookmaster

  def initialize
    Cli.call
  end

  attr_reader :books
  #define method and make it readable to outside class

  def initialize
    @books = []
  end

  def ready_to_search?
    if Cli.call == "y"
      supply_genres
    else puts "Too bad. See you later!"
    end
  end

  def supply_genres
    @genres = ["Best Fiction", "Best Fantasy", "Best Horror", "Best Nonfiction", "Best Science & Technology", "Best Food & Cookbooks", "Best Graphic Novels & Comics"]
    @genres.each.with_index(1) do |g, i|
    puts "#{i}. #{g}"
    @genre = "#{g}"
    Cli.get_genre_choice
    end
  end

  def genre_choice(chosen_genre)
    if chosen_genre == "Best Fiction"
      page_url = "https://www.goodreads.com/choiceawards/best-fiction-books-2018"
    #elsif chosen_genre == "Best Fantasy"
      #page_url = "https://www.goodreads.com/choiceawards/best-fantasy-books-2018"
    #etc
  end
    Scraper.scrape(page_url)
  end

  def create_books
    data = Scraper.new.scrape
    data.each do |data|
       upvotes = data.css("strong.result").text.gsub("\n", "")
       title = data.css("img").attr('alt').value
       url = data.css("a.pollAnswer__bookLink").attr('href').value
       @books << Book.new(title, upvotes, url)
     end
   end

end

#does the heavy lifting. takes in info from other classes and initializes objects according to user input
