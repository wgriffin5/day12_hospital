class PatientsController < ApplicationController

def index
  @hospital = Hospital.find params[:hospital_id]
  @patients = @hospital.patients

end

def new
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patients.new
  @doctors = Doctor.all
end 


def create 
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patients.create patient_params
  if @patient.save
    flash[:notice] = 'Patient was added succesfully'
    @hospital = Hospital.find params[:hospital_id]
    redirect_to hospital_patients_path(@hospital)
  else
    flash[:error] = 'Patient added unsuccessfully'
    render :new
  end
end



def show
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
end

def edit
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
  @doctors = Doctor.all
end

def update
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
  @patient.update_attributes patient_params
  redirect_to root_path
end

def patient_params
  params.require(:patient).permit(
    :first_name,
    :last_name,
    :date_of_birth,
    :description,
    :blood_type,
    :gender
    )
  end

end


