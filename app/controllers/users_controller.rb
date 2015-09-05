class UsersController < ApplicationController
	
	def new
	end

	def create
		user = User.new(user_params)
    	if user.save
      		session[:user_id] = user.id
      		redirect_to moderator_url
    	else
      		redirect_to '/register'
    	end
	end

	private

  		def user_params
    		params.require(:user).permit(:user_name, :password, :password_confirmation)
  		end

end
