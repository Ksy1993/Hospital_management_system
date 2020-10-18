class AppointmentsController < ApplicationController
	def new
	   @appointment = Appointment.new	
	end

	def index
		@appointments = Appointment.all
	end

	def create
		appointment = Appointment.new
		appointment.doctor_id = params[:appointment][:doctor_id]
		appointment.patient_id = params[:appointment][:patient_id]
		appointment.time = params[:appointment][:time]
		appointment.save
		redirect_to "/appointments"
	end

	def edit
		@appointment = Appointment.find(params[:id])
	end

	def destroy
		@appointment = Appointment.find(params[:id])
		if @appointment.destroy
			redirect_to "/appointments"
		end
	end
	def update
		appointment = Appointment.find(params[:id])
		if appointment.update(doctor_id: params[:appointment][:doctor_id],
		 patient_id: params[:appointment][:patient_id])	
		 redirect_to "/appointments"
		end		
	end
end
