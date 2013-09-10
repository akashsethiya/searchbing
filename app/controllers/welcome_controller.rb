class WelcomeController < ApplicationController

	def enter
	end

	def hello
	  	
	  end

	def search
		require 'mechanize'

		@a = params[:qu]
	  	@key = params[:k]

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
			acctKey = "UKP2/eXbBA1cpow12FqFYDYn9W0V4+dy+pOkwMJBnT4"
			user = ''
			web_search_url = "https://api.datamarket.azure.com/Bing/Search/v1/Web?$format=json&Query="
			searchquery = URI.encode_www_form_component('\'' + @a + '\'')
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
			@contents = result_set

	 		# response = RubyWebSearch::Google.search(:query => @a ,:size => 10)
		# 	@abc = response.results
			agent = Mechanize.new # creates the mechanize object
			@contents.each do |con|
				doc = agent.get(con['Url']) #pass your url for which you want to extract the data
				web_title = agent.page.title #this will give you title of the specified url
			#	web_url = agent.page.uri.to_s.split("http://").to_s.split("/")[0] #this will give you website name e.g. www.abc.com
			#	if web_url.to_s == "https:"
			#	web_url = agent.page.uri.to_s.split("https://").to_s.split("/")[0]
			#	end
				html = agent.page.content 
		#		@content = html
		# 		page = MetaInspector.new(@contents[1]['Url'])
		# 		@content = page.meta_description

		#		doc = Pismo::Document.new(@contents[0]['Url'])
		# 		@content= doc.feeds
		# 		if @cont.empty?
		# 			@content="no keywords"
		# 		else 
		# 			@content=doc.keywords[0][0]
		# 		end
		# 		if params[:k].empty?
		# 			@res = Searchre.new
		# 			@res.query = @a.downcase
		# 			@res.title = aq[:title]
		# 			@res.url = aq[:url]
		# 			@res.keyword = @key.downcase
		# 			@res.save
		# 			@resultstry="true"
		 		if html.include?(@key.downcase)
		 			@res = Searchre.new
		 			@res.query = @a.downcase
		 			@res.title = con['Title']
		 			@res.url = con['Url']
		 			@res.keyword = @key.downcase
		 			@res.save
		# 			@resultstry="true"
		#			@result = aq 
		# 		else 
		# 			@resultstry="false"
		 		end
		 	end
		 	searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	   		@finalresult = searchqu
		end
		
	end
end