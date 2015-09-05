class TweetsController < ApplicationController
	def index
      # Grabs all tweets in database
  		@tweets = Tweet.all

      # Adds only filtered tweets to array for displaying on tweets page
  		@tweetsArray ||= Array.new 
  		@tweets.each do |tweet|
        if tweet.filtered == true
  			   @tweetsArray.push("<h3><img src=\"#{tweet.profile_pic}\"></img><span style=\"margin-left: 10px\"><b>#{tweet.user_name}</b></span</h3><p style=\"margin-top: 5px\"><span style=\"color: #026cb6\">@#{tweet.screen_name}:</span> #{tweet.text}</p>".html_safe)
        end
		  end
	end

	def destroy
      # Finds tweet to delete
    	@tweet = Tweet.find(params[:id])
    	if @tweet.destroy
        flash[:success] = "Tweet was successfully deleted."
        redirect_to moderator_url
		  else
        flash[:error] = "There was an error deleting the tweet."
        redirect_to moderator_url
      end
	end

  def destroy_all
    # Deletes all tweets in database
    if Tweet.all.count >= 1 && Tweet.delete_all(:filtered => true)
      flash[:success] = "All tweets were successfully deleted."
      redirect_to moderator_url 
    else
      flash[:error] = "There was an error deleting all tweets."
      redirect_to moderator_url
    end
  end

  def deleteAllUnapproved
    # Deletes all unapproved tweets in database
    if Tweet.where(:filtered => false).count >= 1 && Tweet.delete_all(:filtered => false)
      flash[:success] = "All unapproved tweets were successfully deleted."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error deleting all unapproved tweets."
      redirect_to moderator_url
    end
  end

  def approveAll
    if (Tweet.where(:filtered => false).count) >= 1 && Tweet.update_all( :filtered => true ) 
      flash[:success] = "All tweets were successfully approved."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error approving all tweets."
      redirect_to moderator_url
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attribute(:filtered, "true")
      flash[:success] = "Tweet was successfully approved."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error approving this tweet."
      redirect_to moderator_url
    end
  end

	private
    	# Use callbacks to share common setup or constraints between actions.
   	 	def set_tweet
      		@tweet = Tweet.find(params[:id])
    	end

      def tweet_params
          params.require(:tweet).permit(:user_name, :profile_pic, :screen_name, :text, :filtered)
      end
end
