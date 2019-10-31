require 'spec_helper'

RSpec.describe Cli do

  it "exists" do
    cli = Cli.new
    expect(cli).to be_instance_of(Cli)
  end

  it "initiates passing of user data" do
    cli = Cli.new
    cli.call
    expect(cli.call)
  end
end
