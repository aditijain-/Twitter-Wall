class ModeratorController < ApplicationController
	
	before_filter :authorize
	before_filter :set_keyword
	@@keyword = "house"

	def index
		# Displays most recent tweets and comments in moderator page
		@tweets = Tweet.where(:filtered => false).reverse_order
		@comments = Comment.where(:filtered => false).reverse_order

		# Displays tweets and comments on iWall in moderator page
		@iWallTweets = Tweet.where(:filtered => true).reverse_order
		@iWallComments = Comment.where(:filtered => true).reverse_order

    	# Counts how many tweets and comments currently on the iWall
    	@iWallTweetsCount = Tweet.where(:filtered => true).count
    	@iWallCommentsCount = Comment.where(:filtered => true).count
	end

	# GET /moderator/pullNewTweets
	def pullNewTweets
		# Search query for tweets using Twitter API
		@search = $twitter.search("#{@@keyword} -filter:retweets", lang: "en").take(10)

		# Adds tweets to the SQLite database
		@search.collect do |t|
    		tweet = Tweet.create do |u|
    		  	u.user_name =  t.user.name
    			u.profile_pic = t.user.profile_image_url
    			u.screen_name = t.user.screen_name
    			u.text = t.text
    		end
  		end
  		flash[:info] = "Tweets were successfully pulled."
  		redirect_to moderator_url
  	end


  	#GET /moderator/setKeyword
  	def setKeyword 
  		@@keyword = params[:newKeyword]
      pullNewTweets
  		flash[:info] = "Search updated and new Tweets were successfully pulled"
  	end



end
