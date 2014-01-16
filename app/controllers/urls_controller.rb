class UrlsController < ApplicationController

	def index
		@search_results = []
		@term = session[:term]
		@location = session[:location]

		@urls = Url.all

		@results = SearchResult.order("rank desc")

		#Only display the results of the active search
		#Only runs check if the table has items in it
		if SearchResult.count > 0
			@results.each do |result|
				if result.term == @term && result.location == @location
					@search_results << result
				end
				break if @search_results.length > 9
			end
		end

		# binding.pry
	end

	def parse_url
		#splices url into a term and a location for api
		@term, @location = Url.parse_url(params[:url])

		session[:term] = @term
		session[:location] = @location

		#creates and array of 10 clean results 
		@businesses = Url.call_api(@term, @location)

		#pushes array to the database
		@businesses.each do |business|
			SearchResult.find_or_create_by_name(rating: business["rating"], rating_img_url: business["rating_img_url"], name: business["name"], url: business["url"], display_phone: business["display_phone"], term: "#{@term}", location: "#{@location}")
		end

		redirect_to '/'
	end

	def upvote
		# SearchResult.decrement(:rank)
		id = params[:url_id]
		@selected_result = SearchResult.find(id)

		@selected_result.increment(:rank)
		@selected_result.save!

		redirect_to '/'
	end

		def downvote
		# SearchResult.decrement(:rank)
		id = params[:url_id]
		@selected_result = SearchResult.find(id)

		@selected_result.decrement(:rank)
		@selected_result.save!

		redirect_to '/'
	end
end