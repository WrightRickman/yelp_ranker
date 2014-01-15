class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def parse_url
		@term, @location = Url.parse_url(params[:url])

		@businesses = Url.call_api(@term, @location)



		redirect_to '/'
	end
end