class PatientsController < ApplicationController
	
	def new
		@patient = Patient.new
	end

	def index
		if params[:id]
		   doctor = Doctor.find(params[:id]) 
		   @patients = doctor.patients
		else
		   @patients = Patient.all
		end
	end

	def show
		@patient = Patient.find(params[:id])
	end
	def create
		patient = Patient.new
		patient.name = params[:patient][:name]
		patient.age = params[:patient][:age]
		patient.address = params[:patient][:address]
		patient.contact = params[:patient][:contact]
		patient.gender = params[:patient][:gender]
		patient.save
		redirect_to "/patients"
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to "/patients"
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update(name: params[:patient][:name],age: params[:patient][:age],
			address: params[:patient][:address], contact: params[:patient][:contact],
			 gender: params[:patient][:gender])
		   redirect_to "/patients"
		  end
	end
end
