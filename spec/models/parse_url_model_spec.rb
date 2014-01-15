require 'spec_helper'

describe ".parse_url" do 
	before do
		@term, @location = Url.parse_url("surgeonny")
	end

	it "parses the argument into location and term" do
		expect(@location).should == "ny"
		expect(@term).should == "surgeon"
	end

	it "puts location and term into the url" do
		pending
	end

	it "calls the api " do
		pending
	end

	it "stores results in the database" do
		pending
	end

end