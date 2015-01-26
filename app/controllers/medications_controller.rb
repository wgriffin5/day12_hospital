class MedicationsController < ApplicationController


def index
  @hospital = Hospital.find params[:hospital_id]
  @patients = @hospital.patients
  @medications = @patient.medications 

  # @patient = Patient.find params[:patient_id]
  # @medications = @patient.medications
end

def new
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patient.
  @medication = @patient.medication.new

  # @patient = Patient.find params[:patient_id]
  # @medication = @patient.medication.new
end

def create 
  @hospital = Hospital.find params[:hospital_id]
  @patient = @hospital.patient
  @medication = @hospital.patient.medication.create medication_params
    if @medication.save
      flash[:notice] = 'Medication added.'
      @patient = Patient.find params[:patient_id]
      redirect_to hospital_patients_medications_path
    else
      flash[:error] = 'Medication NOT added successfully'
      render :new

  # @patient = Patient.find params[:patient_id]
  # @medication = @patient.medication.create medication_params   
end

def show
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:patient_id]
  @medication = Medication.find params[:id]
  # @patient = Patient.find params[:patient_id]
  # @medication = Medication.find params[:id]
end

def edit
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:patient]
  @medication = Medication.find params [:id]

  # @patient = Patient.find params[:patient_id]
  # @medication = Medication.find params[:id]
end

def update
  @hospital = Hospital.find params[:hospital_id]
  @patient = Patient.find params[:id]
  @medication.update_attributes patient_params
  redirect_to root_path
end

def medication_params 
  params.require(:medication).permit(
      :name,
      :description,
      :price,
)
end
end