class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def parse_url
		@url_input = Url.parse_url(params[:url])

		redirect_to '/'
	end
end