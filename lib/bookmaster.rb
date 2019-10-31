class Bookmaster

  def initialize
    Cli.new.call
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
  
  def supply_genres
    @genres = ["Best Fiction", "Best Fantasy", "Best Horror", "Best Nonfiction", "Best Science & Technology", "Best Food & Cookbooks", "Best Graphic Novels & Comics"]
    @genres.each.with_index(1) do |g, i|
    puts "#{i}. #{g}"
    @genre = "#{g}"
    end
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
