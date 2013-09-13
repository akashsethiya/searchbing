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
		res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
			http.request(req)
		}
		body = JSON.parse(res.body)
		result_set = body['d']['results']
		return result_set
  	end

  	def check(contents,keyenter,searchq,key)
  		agent = Mechanize.new 
		contents.each do |con|
			doc = agent.get(con['Url']) 
			web_title = agent.page.title 
			html = agent.page.content 
			if keyenter.empty?
				@res = Searchre.new
				@res.query = searchq.downcase
				@res.title = con['Title']
				@res.url = con['Url']
				@res.keyword = key.downcase
		 		@res.save
		 	elsif html.include?(key.downcase)
		 		@res = Searchre.new
		 		@res.query = searchq.downcase
		 		@res.title = con['Title']
		 		@res.url = con['Url']
		 		@res.keyword = key.downcase
		 		@res.save
		 	end
		end
  	end
end
