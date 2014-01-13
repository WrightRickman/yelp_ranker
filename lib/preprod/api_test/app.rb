# Authentication keys are taken from an external file for security.
# PENDING
# Read from external file
# File.open('auth_keys.rtf', 'r') |f|

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

#Sample url takes top 10 bars in brooklyn
path = "/v2/search?term=bars&location=brooklyn&limit=10"

@result = access_token.get(path).body

#Cleans Json
@results_clean = JSON.parse(@result)

#Removes unwanted geolocation data
@businesses = @results_clean["businesses"]