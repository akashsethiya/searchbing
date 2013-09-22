class ApplicationController < ActionController::Base
  protect_from_forgery

  	def searchbing(searchqu)
	  	acctKey = "UKP2/eXbBA1cpow12FqFYDYn9W0V4+dy+pOkwMJBnT4"
		user = ''
		web_search_url = "https://api.datamarket.azure.com/Bing/Search/v1/Web?$format=json&Query="
		searchquery = URI.encode_www_form_component('\'' + searchqu + '\'')
		limit = "&$top=10"
		full_address = web_search_url + searchquery + limit
		uri = URI(full_address)
		req = Net::HTTP::Get.new(uri.request_uri)
		req.basic_auth user, acctKey
		res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https' ){|http|
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			http.request(req)
		}
		body = JSON.parse(res.body)
		result_set = body['d']['results']
		return result_set
  	end

  	def check(contents,keyenter,searchq,key)
  		agent = Mechanize.new 
		contents.each do |con|
			html = open(con['Url']).read
			@pa =  html
			# doc = agent.get(con['Url']) 
			# web_title = agent.page.title 
			# html = agent.page.content 
	  		@words = @keyenter.split
			if keyenter.empty?
				@res = Searchre.new
				@res.query = searchq.downcase
				@res.title = con['Title']
				@res.url = con['Url']
				@res.keyword = key.downcase
		 		@res.save
		 	else
		 		@words.each do |keyword|
		 			if html.downcase.include?(keyword.downcase)
		 				@res = Searchre.new
		 				@res.query = searchq.downcase
		 				@res.title = con['Title']
		 				@res.url = con['Url']
		 				@res.keyword = keyword.downcase
		 				@res.save
		 			end
		 		end
		 	end
		end
  	end

  	def configtwitter()
  		consumer_key = "IAU0m2vQ5FkwvcfAQXlLw"
  		consumer_secret = "N9qZfmlHRB2NALKEUY7ZgNfu0JvL7rzmBs3oqEDE"
  		access_token = "1853474826-yjAh5X2ArUGGaROffvJjWWIorxStgyGBAYC4d6n"
  		access_token_secret = "6eSU7UIsFM7qpptixOSMXU7fkLyiAzbzH5us9arBCWo"
		client = Twitter::REST::Client.new
		client.consumer_key        = consumer_key
		client.consumer_secret     = consumer_secret
		client.access_token        = access_token
		client.access_token_secret = access_token_secret
		return client

  	end

  	def searchtweet(searchq)
  	  	@fname = searchq.partition(" ")[0]
		client = configtwitter()
		tweet = client.search(@fname)
		return tweet
	end

	def searchuser(searchq)
		client = configtwitter()
		user = client.user_search(searchq)
		return user
  	end


  	def find(keyenter,searchquery,key)
  		if keyenter.empty?
			searchqu = Searchre.where(query: searchquery.downcase,keyword: key.downcase)
		else
	  		@words = keyenter.downcase.split
	  		searchqu = Searchre.where(query: searchquery.downcase).in(keyword: @words)
	  	end
	  	return searchqu
  	end
end
