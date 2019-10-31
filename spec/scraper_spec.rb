require 'spec_helper'

RSpec.describe Scraper do

  it "exists" do
    scraper = Scraper.new
    expect(scraper).to be_instance_of(Scraper)
  end

  it "gets data" do
    scraper = Scraper.new
    expect(scraper.scrape.length).not_to eq(0)
  end
end
