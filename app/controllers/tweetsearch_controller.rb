class TweetsearchController < ApplicationController
  def search
  

  end
  def tweet
  	@que = params[:searchq]
  	consumer_key = "8yeedbqudn0C4vIsYNSDg"
  	consumer_secret = "nB68IUyW0JrOoVnDKRSIk8nyoC4dD71Cyxy9PEM"
  	access_token = "1853474826-s9Tp6g1xYACDf2otf80f6vtiC0VyhllECllVPBt"
  	access_token_secret = "vYcN8aZzp2TEY7VkWVy4c1n41qX2TTOXJU20IUx5rY"


	client = Twitter::REST::Client.new
	client.consumer_key        = consumer_key
	client.consumer_secret     = consumer_secret
	client.access_token        = access_token
	client.access_token_secret = access_token_secret

	#client.update("Hello")
	body = client.search('hrithik')

	# web_search_url = "https://api.twitter.com/1.1/search/tweets.json?q="
	# searchquery = URI.encode_www_form_component('\'' + @que + '\'')
	# full_address = web_search_url + searchquery
	# uri = URI(full_address)
	# req = Net::HTTP::Get.new(uri.request_uri)
	# req.basic_auth oauth_token, oauth_token_secret
	# res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
	# http.request(req)
	# }

	# body = JSON.parse(res.body)
	 @disp = body

#	client = TwitterOAuth::Client.new(
 #    	:consumer_key => consumer_key,
 #    	:consumer_secret => consumer_secret,
 #    	:token => oauth_token,
 #    	:secret => oauth_token_secret
	# )

	# body = client.search(@que)

	# @disp = body[1]


#	httpauth = Twitter::HTTPAuth.new('akash_sethiya', 'possimpible')
#	client = Twitter::Base.new(httpauth)
#	client.update('akash.!')


  end
end
