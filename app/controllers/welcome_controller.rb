class WelcomeController < ApplicationController

	def enter
	end

	def hello
	  	
	end

	def search
		require 'mechanize'

		@a = params[:qu]
	  	@key = params[:k]
	  	@keyenter = params[:k]

	  	if params[:k].empty?
			@key=params[:qu]
		end
		

	#	ser=Searchre.where(Keyword: "akash".downcase).destroy
	 	
	  	searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	  	@us= searchqu.exists?
	#	searchqu1 = Searchre.where(query: @a.downcase)
	#	@us1 = searchqu1.exists?
		if(@us)
	  		@finalresult = searchqu
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
	 	# 	agent = Mechanize.new # creates the mechanize object
			# @contents.each do |con|
			# 	doc = agent.get(con['Url']) 
			# 	web_title = agent.page.title 
			# 	html = agent.page.content 
	
		 # 		if params[:k].empty?
		 # 			@res = Searchre.new
		 # 			@res.query = @a.downcase
		 # 			@res.title = con['Title']
		 # 			@res.url = con['Url']
		 # 			@res.keyword = @key.downcase
		 # 			@res.save
		 # 		elsif html.include?(@key.downcase)
		 # 			@res = Searchre.new
		 # 			@res.query = @a.downcase
		 # 			@res.title = con['Title']
		 # 			@res.url = con['Url']
		 # 			@res.keyword = @key.downcase
		 # 			@res.save
		 # 		end
		 # 	end
		 	searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	   		@finalresult = searchqu
		end
		
	end

	def reload
		@searchq = params[:q]
		@key = params[:key]
		@keyenter = params[:keyenter]
		ser=Searchre.where(query: @searchq.downcase).destroy
		@result = searchbing(@searchq)
		check(@result,@keyenter,@searchq,@key)
		searchqu = Searchre.where( query: @searchq.downcase ,keyword: @key.downcase)
	   	@finalresult = searchqu
	end

end