class WelcomeController < ApplicationController

	def enter
	end

	def hello
	  	require 'ruby-web-search'
	  	require 'pismo'
	  end

	def search
		require 'gnib'
		@a = params[:qu]
	  	@key = params[:k]

	  	if params[:k].empty?
			@key=params[:qu]
		end


		# Gnib.config.application_id = 'UKP2/eXbBA1cpow12FqFYDYn9W0V4+dy+pOkwMJBnT4'
		# @contents = Gnib::Search.get('google', :sources => [:web])

 #	ser=Searchre.where(query: @a.downcase).destroy
	  	searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	  	@us= searchqu.exists?


	  #	searchqu1 = Searchre.where(query: @a.downcase)
	  #	@us1 = searchqu1.exists?

		if(@us)
	  		@awe = searchqu
	   	else
		response = RubyWebSearch::Google.search(:query => @a ,:size => 10)
			@abc = response.results
			@abc.each do |aq|
				page = MetaInspector.new(aq[:url])
				@content = page.document
		#		doc = Pismo::Document.new(@abc[1][:url])
		#		@content= doc.html_body
		#		if @cont.empty?
		#			@content="no keywords"
		#		else 
		#			@content=doc.keywords[0][0]
		#		end
				if params[:k].empty?
					@res = Searchre.new
					@res.query = @a.downcase
					@res.title = aq[:title]
					@res.url = aq[:url]
					@res.keyword = @key.downcase
					@res.save
					@resultstry="true"
				elsif @content.include?(@key.downcase)
					@res = Searchre.new
					@res.query = @a.downcase
					@res.title = aq[:title]
					@res.url = aq[:url]
					@res.keyword = @key.downcase
					@res.save
					@resultstry="true"
				else 
					@resultstry="false"
				end
			end
			searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	  		@awe = searchqu
		end
		
	end
end