class DepartmentsController < ApplicationController
	def new
		@department = Department.new
	end
	def show
        @department = Department.find(params[:id])
	end

	def create
		department = Department.new
		department.name = params[:department][:name]
		if department.save
			redirect_to new_department_path
		end
	end

	def index
		@departments = Department.all
	end
end
