require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize
  end

  def scrape
    page = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-fiction-books-2018"))
    books = page.css("div.resultShown")
  end

end
