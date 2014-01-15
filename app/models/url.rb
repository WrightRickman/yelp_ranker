class Url < ActiveRecord::Base
	attr_accessible :url

	def self.parse_url(url)

		@term = url.gsub("ny", "")
		@location = url.scan(/ny/).join

		return [@term, @location]
	end

	def call_api(term, location)

		api_host = 'api.yelp.com'

		consumer_key = ENV['YELP_CONSUMER_KEY']
		consumer_secret = ENV['YELP_CONSUMER_SECRET']
		token = ENV['YELP_TOKEN']
		token_secret = ENV['YELP_TOKEN_SECRET']

		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		#Sample url takes top 10 bars in brooklyn
		path = "/v2/search?term=#{@term}&location=#{@location}&limit=10"

		@result = access_token.get(path).body

		#Cleans Json
		@results_clean = JSON.parse(@result)

		#Removes unwanted geolocation data
		@businesses = @results_clean["businesses"]

		return @businesses
	end
end
