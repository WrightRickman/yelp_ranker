class Url < ActiveRecord::Base
  attr_accessible :url

  def self.parse_url(url)
  	@location = url.scan(/ny/)
  	@term = url.gsub("ny", "")

  	api_host = 'api.yelp.com'

  	# ENV['NAME_OF_VARIABLE_IN_ALL_CAPS']
	consumer_key = ENV['YELP_CONSUMER_KEY']
	consumer_secret = ENV['YELP_CONSUMER_SECRET']
	token = ENV['YELP_TOKEN']
	token_secret = ENV['YELP_TOKEN_SECRET']

	# consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
	# access_token = OAuth::AccessToken.new(consumer, token, token_secret)

	# #Sample url takes top 10 bars in brooklyn
	# path = "/v2/search?term=#{@term}&location=#{@location}&limit=10"

	# @result = access_token.get(path).body

	# #Cleans Json
	# @results_clean = JSON.parse(@result)

	# #Removes unwanted geolocation data
	# @businesses = @results_clean["businesses"]
  end
end
