class Book

  attr_reader :title, :upvotes, :url

  def initialize(title, upvotes, url)
    @title = title
    @upvotes = upvotes
    @url = url
  end

end

#creates books that will have specific attributes
