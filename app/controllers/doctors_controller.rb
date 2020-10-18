class DoctorsController < ApplicationController
 before_action :authenticate_user!
	def new
		@doctor = Doctor.new
	end

	def index	   
          @doctors = Doctor.all
	end

	def show
		@doctor = Doctor.find(params[:id])
	end

    def edit
    	@doctor = Doctor.find(params[:id])
    end

	def create
		doctor = Doctor.new
		doctor.name = params[:doctor][:name]
		doctor.contact_no = params[:doctor][:contact_no]
		doctor.address = params[:doctor][:address]
		doctor.salary = params[:doctor][:salary]
		doctor.department_id = params[:doctor][:department_id]
		doctor.save
		redirect_to doctors_path
	end
	def update
		@doctor = Doctor.find(params[:id])
		if @doctor.update(name: params[:doctor][:name], contact_no: params[:doctor][:contact_no], address:
			params[:doctor][:address],salary: params[:doctor][:salary])
		    redirect_to doctors_path
         else
         	render "edit"
		end
	end

	def destroy
		@doctor = Doctor.find(params[:id])
		@doctor.destroy
		redirect_to doctors_path
	end
	def disable
		doctor = Doctor.find_by(id:params[:id])
		if doctor.update(status:false)
			redirect_to doctors_path
	    end
    end
end
