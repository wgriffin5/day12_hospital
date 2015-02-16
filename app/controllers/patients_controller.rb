class PatientsController < ApplicationController

before_action :set_patient, only: [
  :show,
  :edit,
  :update,
  :destroy,
  :wait_patient,
  :check_up_patient,
  :x_ray_patient,
  :surgery_patient,
  :bills_patient,
  :leave_patient
]

def patient_wait
  set_patient
  @patient.wait!
  redirect_to hospital_patient_path(@hospital, @patient) 
end

def patient_checking_up
  set_patient
  @patient.check_up!
  redirect_to hospital_patient_path(@hospital, @patient)
end

def patient_x_raying
  set_patient
  @patient.x_ray!
  redirect_to hospital_patient_path(@hospital, @patient)
end

def patient_surged
  set_patient
  @patient.surgery!
  redirect_to hospital_patient_path(@hospital, @patient)
end

def patient_billing
  set_patient
  @patient.bills!
  redirect_to hospital_patient_path(@hospital, @patient)
end

def leaving
  set_patient
  @patient.leave!
  redirect_to hospital_patient_path(@hospital, @patient)
end

def set_patient
  @patient = Patient.find params[:id]
  @hospital = Hospital.find @patient.hospital_id
end 


def index
  @hospital = Hospital.find params[:hospital_id]
  # @patients = if !params[:q].blank?
  #   Patient.where("last_name LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  # else
  #   puts "HEY WILLIAM"
  @patients = @hospital.patients
  # end
  respond_to do |format|
    format.js
    format.html
  end
end

def new
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patients.new
  @doctors = Doctor.all
  @medications = Medication.all
  @patients = Patient.all
end 


def create 
  @medications = Medication.all
  @doctors = Doctor.all
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
  @doctors = @patient.doctors
  @medication = @patient.medications
  @medications = Medication.all
  @hospitals = Hospital.all
end

def edit
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
  @doctors = Doctor.all
  @patients = Patient.all
  @medications = Medication.all
  @hospitals = Hospital.all 
end

def update
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
  @patient.update_attributes patient_params
  redirect_to hospital_patients_path
end

def destroy
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patients.find params[:id]
  @patient.delete
  redirect_to hospital_patients_path
end

private 


def patient_params
  params.require(:patient).permit(
    :first_name,
    :last_name,
    :date_of_birth,
    :description,
    :blood_type,
    :gender,
    :workflow_state,
    patient_ids: [],
    doctor_ids: [],
    hospital_ids: [],
    medication_ids: [],
    )
  end

end


