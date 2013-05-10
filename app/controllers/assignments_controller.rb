class AssignmentsController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]

	def index
        @assignments = Assignment.paginate(page: params[:page], per_page: 5)
    end

    def show
		@assignment = Assignment.find(params[:id])
	end

	def new
		@assignment = Assignment.new
	end

	def create
    @assignment = current_user.assignment.build(assignment_params)  
        if @assignment.save
            redirect_to @assignment
        else
        	render 'new'
        end
    end




private
        def assignment_params
  		  params.require(:assignment).permit!
  		end
	
	def signed_in_user
        unless signed_in?
            ## store_locaiton <-- Method doesn't work because can't access the Sessions Helper?
            redirect_to signin_url, notice: "Please sign in to access this page."
        end
    end
end
