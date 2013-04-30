class DepartmentsController < ApplicationController
	def show
		@department = Department.find(params[:id])
	end

	def new
		@department = Department.new
  	end

  def create
  	@department = Department.new(department_params)
  	if @department.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  private

  	def department_params
  		# This says that params[:department] is required, but inside that, only params[:department][:full_name] and 
  		# params[:department][:abbreviation] are permitted. Unpermitted params will be stripped out  		

  		params.require(:department).permit(:full_name, :abbreviation)
  	end
end
