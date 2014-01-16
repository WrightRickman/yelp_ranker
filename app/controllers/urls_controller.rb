class UrlsController < ApplicationController

	def index
		# @search_results = []
		# @term = session[:term]
		# @location = session[:location]

		# @urls = Url.all

		# @results = SearchResult.order("rank desc")

		# #Only display the results of the active search
		# #Only runs check if the table has items in it
		# if SearchResult.count > 0
		# 	@results.each do |result|
		# 		if @search_results > 9
		# 		# if result.term == @term && result.location == @location
		# 			@search_results << result
		# 		# end
		# 			break if @search_results.length > 9
		# 		end
		# 	end
		# end

		# binding.pry
	end

	def parse_url
		@search_results = []
		# @term = ""
		# @location = ""
		#splices url into a term and a location for api

		term_location = Url.parse_url(params[:url])
		@term = term_location[0]
		@location = term_location[1]

		# √ 

		# session[:term] = @term
		# session[:location] = @location

		#creates and array of 10 clean results 
		@businesses = Url.call_api(@term, @location)

		#  √

		#pushes array to the database
		@businesses.each do |business|
			data_hash = {rating: business["rating"], 
			rating_img_url: business["rating_img_url"],
			name: business["name"], 
			url: business["url"], 
			display_phone: business["display_phone"], 
			term: @term, 
			location: @location}
			SearchResult.where(:term => @term, :location => @location).create(data_hash)
		end

		#  √
		
		# term = session[:term]
		# location = session[:location]

		@urls = Url.all

		results = SearchResult.order("rank desc")

		# binding.pry

		#Only display the results of the active search
		#Only runs check if the table has items in it
		if SearchResult.count > 0
			results.each do |result|
				# puts result.term
				# puts result.location
				if result.location == @location && result.term == @term
					@search_results << result
				end
				break if @search_results.length > 9
				# puts @search_results
			end
		end

		# binding.pry

		render :index
		# redirect_to '/'
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