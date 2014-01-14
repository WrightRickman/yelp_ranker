require 'spec_helper'

describe 'Url' do
	before do
		visit root_path
		login_as(@user)
	end

	# describe "given a URL" do
	# 	before do
	# 		@url = 'restaurantnewyorkny'
	# 	end
	# end

	# describe "user enters a url" do
	# 	before do
	# 		fill_in 'url', :with => @url
	# 		click_button :submit
	# 	end

	# 	it "displays the url" do
	# 		current_path.should == '/'
	# 		page.should have_content(@url)
	# 	end
	# end
end