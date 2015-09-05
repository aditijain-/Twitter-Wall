
class PagesController < ApplicationController
	def home
		# Takes tweets and comments from the database
		@tweets = Tweet.all
		@comments = Comment.all

		# Puts only filtered tweets into array for displaying on front page
		@tweetsArray ||= Array.new 
		@tweets.each do |tweet|
        	if tweet.filtered == true
  			   @tweetsArray.push("<h3><img src=\"#{tweet.profile_pic}\"></img><span style=\"margin-left: 10px\"><b>#{tweet.user_name}</b></span</h3><p style=\"margin-top: 5px\"><span style=\"color: #026cb6\">@#{tweet.screen_name}:</span> #{tweet.text}</p>".html_safe)
        	end
		end

		# Puts only filtered comments into array for displaying on front page
		@commentsArray ||= Array.new 
    	@comments.each do |comment|
        	if comment.filtered == true
           		@commentsArray.push("<h3><span style=\"margin-left: 10px\"><b>#{comment.name}</b></span></h3><p style=\"margin-left: 10px; margin-top: 5px\">#{comment.comment}</p>".html_safe)
        	end
      	end
	end
end
