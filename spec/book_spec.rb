require 'spec_helper'

RSpec.describe Book do
  it "exists" do
    book = Book.new("pride and prejudice", 2000, "www.goodbook.com")
    expect(book).to be_instance_of(Book)
  end

  it "has the right attributes" do
    book = Book.new("pride and prejudice", 2000, "www.goodbook.com")
    expect(book.title).to eq("pride and prejudice")
    expect(book.upvotes).to eq(2000)
    expect(book.url).to eq("www.goodbook.com")
  end
end
