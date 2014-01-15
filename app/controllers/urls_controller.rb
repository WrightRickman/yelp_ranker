class UrlsController < ApplicationController

	def index
		@urls = Url.all
		@results = SearchResult.all
	end

	def parse_url
		#splices url into a term and a location for api
		@term, @location = Url.parse_url(params[:url])

		#creates and array of 10 clean results 
		@businesses = Url.call_api(@term, @location)

		#pushes array to the database
		@businesses.each do |business|
			SearchResult.create(result: business)
		end

		redirect_to '/'
	end
end