class WelcomeController < ApplicationController

	def enter
	end

	def hello
#	 searchqu1 = Searchre.where(query: "akash sethiya").destroy

	end


	def search
	
		@a = params[:qu]
	  	@key = params[:k]
	  	@keyenter = params[:k]
	  	@words = @keyenter.downcase.split
	  	if params[:k].empty?
			@key=params[:qu]
	  	end
		@us = find(@keyenter,@a,@key)
		if(@us.exists?)
	  		@finalresult = @us.distinct(:url)
	 	else
			# acctKey = "UKP2/eXbBA1cpow12FqFYDYn9W0V4+dy+pOkwMJBnT4"
			# user = ''
			# web_search_url = "https://api.datamarket.azure.com/Bing/Search/v1/Web?$format=json&Query="
			# searchquery = URI.encode_www_form_component('\'' + @a + '\'')
			# limit = "&$top=10"
			# full_address = web_search_url + searchquery + limit

			# uri = URI(full_address)
			# req = Net::HTTP::Get.new(uri.request_uri)
			# req.basic_auth user, acctKey

			# res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
  	# 			http.request(req)
			# }

			# body = JSON.parse(res.body)
			# result_set = body['d']['results']
			@contents = searchbing(@a)
			check(@contents,@keyenter,@a,@key)
		 	searchqu = find(@keyenter,@a,@key)
	   		@finalresult = searchqu.distinct(:url)
		end

		# uri = URI("http://en.wikipedia.org/wiki/George_clooney")
		# req = Net::HTTP::Get.new(uri.request_uri)
		# req.basic_auth '',''
		# res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
  # 	 		http.request(req)
		# }
		# @bo = JSON.parse(res.body)
		@tweet = searchtweet(@a)
		user = searchuser(@a)
		@disp = user
	end

	def reload
		@searchq = params[:q]
		@key = params[:key]
		@keyenter = params[:keyenter]
		searchqu = find(@keyenter,@searchq,@key)
	  	searchqu.destroy
	  	@result = searchbing(@searchq)
		check(@result,@keyenter,@searchq,@key)
		searchqu = find(@keyenter,@searchq,@key)
	#	searchqu = Searchre.where( query: @searchq.downcase ,keyword: @key.downcase)
	   	@finalresult = searchqu.distinct(:url)
	   	@tweet = searchtweet(@searchq)
		user = searchuser(@searchq)
		@disp = user
	end

end