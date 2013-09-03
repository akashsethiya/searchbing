class WelcomeController < ApplicationController

	def enter
	end

	def hello
	  	require 'ruby-web-search'
	  	require 'pismo'
	  end

	def search
		require 'rbing'
		
		@a = params[:qu]
	  	@key = params[:k]

	  	if params[:k].empty?
			@key=params[:qu]
		end
		#	response = RubyWebSearch::Google.search(:query => @a ,:size => 10)
		#	@abc = response.results
		bing = RBing.new("a4512de273e6482c8574b5389cb14a5c")
		rsp = bing.web(@a)
		@content = rsp.results[0].title

		#	@abc.each do |aq|
		#		page = MetaInspector.new(aq[:url])
		#		@content = page.document
		#		doc = Pismo::Document.new(@abc[1][:url])
		#		@content= doc.html_body
		#		if @cont.empty?
		#			@content="no keywords"
		#		else 
		#			@content=doc.keywords[0][0]
		#		end
		#		end
		#	end
		#	searchqu = Searchre.where( query: @a.downcase ,keyword: @key.downcase)
	  	#	@awe = searchqu
		#end
		
	end
end