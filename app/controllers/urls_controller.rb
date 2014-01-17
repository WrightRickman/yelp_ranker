class UrlsController < ApplicationController

	def index
		@search_results = []
		@term = session[:term]
		@location = session[:location]

		@urls = Url.all

		results = SearchResult.order("rank desc")

		#Does not run the check if db is empty
		if SearchResult.count > 0
			results.each do |result|
				#Only displays the results of the active search, clears previous searches
				if result.location == @location && result.term == @term
					@search_results << result
				end
				#Stops the loop after 10 results
				break if @search_results.length > 9
			end
		end
	end

	def supported
		@urls = Url.all
	end

	def parse_url
		term_location = Url.parse_url(params[:url])
		@term = term_location[0]
		@location = term_location[1]

		session[:term] = @term
		session[:location] = @location

		#creates and array of 20 clean results 
		@businesses = Url.call_api(@term, @location)

		#adds a result to the database if it does not yet exist
		@businesses.each do |business|
			data_hash = {rating: business["rating"], 
			rating_img_url: business["rating_img_url"],
			name: business["name"], 
			url: business["url"], 
			display_phone: business["display_phone"], 
			snippet_img_url: business["snippet_image_url"],
			term: @term, 
			location: @location}
			SearchResult.where(:term => @term, :location => @location).create(data_hash)
		end

		redirect_to '/'
	end

	def call_api
		term = params[:term]
		location = params[:location]


		term_clean = term.gsub(" ", "%20")
		location_clean = location.gsub(" ", "%20")

		session[:term] = term_clean
		session[:location] = location_clean

		businesses = Url.call_api(term_clean, location_clean)

		#adds a result to the database if it does not yet exist
		businesses.each do |business|
			data_hash = {rating: business["rating"], 
			rating_img_url: business["rating_img_url"],
			name: business["name"], 
			url: business["url"], 
			display_phone: business["display_phone"], 
			snippet_img_url: business["snippet_image_url"],
			term: term_clean, 
			location: location_clean}
			SearchResult.where(:term => @term, :location => @location).create(data_hash)
		end

		redirect_to '/'
	end

	def upvote
		id = params[:url_id]
		@selected_result = SearchResult.find(id)

		@selected_result.increment(:rank)
		@selected_result.save!

		redirect_to '/'
	end

		def downvote
		id = params[:url_id]
		@selected_result = SearchResult.find(id)

		@selected_result.decrement(:rank)
		@selected_result.save!

		redirect_to '/'
	end
end