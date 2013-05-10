class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]

    def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
        @department = Department.all
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

    def edit
        # @user defined in current_user before filter
    end

    def update
        # @user defined in current_user before filter
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            sign_in @user
            redirect_to @user
        else
            render 'edit'
        end
    end

  	private
        def user_params
  		# This says that params[:department] is required, but inside that, only params[:department][:full_name] and 
  		# params[:department][:abbreviation] are permitted. Unpermitted params will be stripped out  		
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :department_id, :role,)
  		end

        # Before filters

        def signed_in_user
            unless signed_in?
                ## store_locaiton <-- Method doesn't work because can't access the Sessions Helper?
                redirect_to signin_url, notice: "Please sign in to access this page."
            end
        end

        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_path) unless current_user?(@user)
        end
end
