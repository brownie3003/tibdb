class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
    	@user = User.new(user_params)  
    	if @user.save
        sign_in @user
        flash[:success] = "Welcome to the TiB Assignment Database"
    		redirect_to @user
    	else
    		render 'new'
    	end
  	end

  	private
  	  def user_params
  		# This says that params[:department] is required, but inside that, only params[:department][:full_name] and 
  		# params[:department][:abbreviation] are permitted. Unpermitted params will be stripped out  		

  		  params.require(:user).permit!
  		end
end
