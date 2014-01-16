class Url < ActiveRecord::Base
	attr_accessible :url

	def self.parse_url(url)
		#barsny
		if url.include?("ny")
			unless url.include?("nyc") || url.include?("newyork")
				@term = url.gsub("ny", "")
				@location = url.scan(/ny/).join
			end
		end

		# binding.pry

		#barsnyc
		if url.include?("nyc")
			@term = url.gsub("nyc", "")
			@location = url.scan(/nyc/).join
		end	
			#barsnewyork, not barsnewyorkny
		if url.include?("newyork")
			unless url.include?("newyorkny")
				@term = url.gsub("newyork", "")
				@location = url.scan(/newyork/).join.gsub("newyork", "new%20york")
			end
		end

		# binding.pry

			#barsnewyorkny && neyorknybars
		if url.include?("newyorkny")
			@term = url.gsub("newyorkny", "")
			@location = url.scan(/newyorkny/).join.gsub("newyorkny", "new%20york%20ny")
		end

		# binding.pry

			#barsla
		if url.include?("la")
			unless url.include?("philadelphia")
				@term = url.gsub("la", "")
				@location = url.scan(/la/).join
			end
		end

		# binding.pry

		if url.include?("losangelesca") 
			@term = url.gsub("losangelesca", "")
			@location = url.scan(/losangelesca/).join.gsub("losangelesca", "los%20angeles%20ca")
		end

		# binding.pry

			#barsphiladelphia, not barsphiladelphiapa
		if url.include?("philadelphia")
			unless url.include?("philadelphiapa")
				@term = url.gsub("philadelphia", "")
				@location = url.scan(/philadelphia/).join
			end
		end

		# binding.pry

			#barsphiladelphiapa
		if url.include?("philadelphiapa") # empty
			@term = url.gsub("philadelphiapa", "")
			@location = url.scan(/philadelphiapa/).join.gsub("philadelphiapa", "philadelphia%20pa")
		end

		# binding.pry

		return [@term, @location]

		# binding.pry
	end

	def self.call_api(term, location)

		#Sets host
		api_host = 'api.yelp.com'

		#Keys are set in an Env. Vriable
		consumer_key = ENV['YELP_CONSUMER_KEY']
		consumer_secret = ENV['YELP_CONSUMER_SECRET']
		token = ENV['YELP_TOKEN']
		token_secret = ENV['YELP_TOKEN_SECRET']

		#access OAuth
		consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
		access_token = OAuth::AccessToken.new(consumer, token, token_secret)

		#Sample url takes top 10 @term in @location
		path = "/v2/search?term=#{@term}&location=#{@location}&limit=10"

		#get Json from api
		@result = access_token.get(path).body

		#Cleans Json
		@results_clean = JSON.parse(@result)

		#Removes unwanted geolocation data
		@businesses = @results_clean["businesses"]

		return @businesses
	end
end
