class PatientsController < ApplicationController

def new
  @patient = Patient.new
end 


def create 
  @patient = Patient.create patient_params
  if @patient.save
    flash[:notice] = 'Patient was added succesfully'
    redirect_to patients_path
  else
    flash[:error] = 'Patient added unsuccessfully'
    render :new
end

end

def show
  @patient = Patient.find params[:id]
end

def edit
  @patient = Patient.find params[:id]
end

def update
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


