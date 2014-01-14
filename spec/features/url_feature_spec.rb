require 'spec_helper'

describe 'Url' do
	# before do
	# 	visit root_path
	# 	login_as(@user)
	# end

	describe "given a URL" do
		before do
			@url = 'surgeonny'
		end

		describe "and I visit the root" do
			# visit '/'
			# login_as(@user)
		end

		describe "user enters a url" do
			before do
				visit '/'
				fill_in 'url', :with => @url
				click_button :submit
			end

			it "should add url to form and submit" do
				# current_path.should == '/'
				# page.should have_content(@url)
				fill_in 'url', :with => @url
				click_button :submit
			end	
		end
	end
end
