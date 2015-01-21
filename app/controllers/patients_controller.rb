class PatientsController < ApplicationController

def new
  @patient = Patient.new
end 


def create 
  @patient = Patient.create patient_params
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


