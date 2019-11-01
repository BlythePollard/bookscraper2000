require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize
  end

  def scrape(page_url)
    page = Nokogiri::HTML(open(page_url))
    books = page.css("div.resultShown")
  end

end
