class CreateTweets < ActiveRecord::Migration
	def change
    	create_table :tweets do |t|
    	t.string :user_name
    	t.string :profile_pic
    	t.string :screen_name
    	t.string :text
    	t.string :time_posted

    	t.timestamps null: false
    	end
  	end
end
