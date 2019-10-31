require 'spec_helper'

RSpec.describe Bookmaster do

  it "exists" do
    bookmaster = Bookmaster.new
    expect(bookmaster).to be_instance_of(Bookmaster)
  end

  it "creates books from scraper input" do
    bookmaster = Bookmaster.new
    bookmaster.create_books
    expect(bookmaster.books.length).to eq(20)
  end

  it "intilializes CLI" do 
    cli = Cli.new
    expect(cli).to be_instance_of(Cli)
  end
end
