require 'spec_helper'

describe 'Url' do
	describe "given a URL" do
		before do
			@url = 'restaurantnewyorkny'
			visit 'urls#index'
		end
	end

	describe "user enters a url" do
		before do
			fill_in :url, with: @url
			click_button :submit
		end

		it "takes you to the url" do
			current_path.should == urls_path
			page.should have_content(@url)
		end
	end
end