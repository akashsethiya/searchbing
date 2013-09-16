class TweetsearchController < ApplicationController
  def search
  

  end
  def tweet
  	
	require "fbgraph"

  	@que = params[:searchq]
  	consumer_key = "IAU0m2vQ5FkwvcfAQXlLw"
  	consumer_secret = "N9qZfmlHRB2NALKEUY7ZgNfu0JvL7rzmBs3oqEDE"
  	access_token = "1853474826-yjAh5X2ArUGGaROffvJjWWIorxStgyGBAYC4d6n"
  	access_token_secret = "6eSU7UIsFM7qpptixOSMXU7fkLyiAzbzH5us9arBCWo"

  	@fname = @que.partition(" ")[0]
	#clienta = FBGraph::Client.new(:client_id => '684933954868914',:secret_id =>'f04a78f08d896f642455d70483c6332f')
	
	# consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => 'https://twitter.com'})
	# request_token = OAuth::RequestToken.new(consumer, access_token, access_token_secret)
	# access_token = request_token.get_access_token
	
	client = Twitter::REST::Client.new
	client.consumer_key        = consumer_key
	client.consumer_secret     = consumer_secret
	client.access_token        = access_token
	client.access_token_secret = access_token_secret
	
	#client.update("@gem!")

	@tweet = client.search(@fname)
	user = client.user_search(@que)
	#body = clienta.search.query('akash').on('users')
	@disp = user

	# web_search_url = "https://graph.facebook.com/search?q="
	# searchquery = URI.encode_www_form_component('\'' + @que + '\'')
	# full_address = web_search_url + searchquery
	# uri = URI(full_address)
	# req = Net::HTTP::Get.new(uri.request_uri)
	# req.basic_auth '684933954868914', 'f04a78f08d896f642455d70483c6332f'
	# res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
	# http.request(req)
	# }

	# body = JSON.parse(res.body)

	#body = client.search('#akash')
	#web_search_url = "https://api.twitter.com/1.1/search/tweets.json?q="
	# searchquery = URI.encode_www_form_component('\'' + @que + '\'')
	# full_address = web_search_url + searchquery
	# uri = URI(full_address)
	# req = Net::HTTP::Get.new(uri.request_uri)
	# req.basic_auth oauth_token, oauth_token_secret
	# res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
	# http.request(req)
	# }

	# body = JSON.parse(res.body)
	#@disp = body
#	client = TwitterOAuth::Client.new(
#    	:consumer_key => consumer_key,
#    	:consumer_secret => consumer_secret,
#    	:token => oauth_token,
#    	:secret => oauth_token_secret
	# )

	# body = client.search(@que)

	# @disp = body[1]


  end
end
