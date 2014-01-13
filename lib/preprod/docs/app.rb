consumer_key = 'S0IR57A-4vSKPug0L8m-ww'
consumer_secret = 'GvjmfqTin_IVYzARabY5gYaf6NI'
token = 'NoIN8MvjVYbxJqQjNmMEJ_h1udsILb_f'
token_secret = '6PSYaHHHJiYncgkzNwOm-Hxi_z4'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

path = "/v2/search?term=bars&location=brooklyn&limit=10"

@result = access_token.get(path).body

@results_clean = JSON.parse(@result)

@businesses = @results_clean["businesses"]