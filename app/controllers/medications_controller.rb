class MedicationsController < ApplicationController


def index

  # @hospitals = Hospital.find params[:hospital_id]
  # @patients = @hospital.patients
  @medications = Medication.all 
  @medications = if !params[:q].blank?
    Medication.where("name LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  else
    puts "HEY WILLIAM"
    Medication.all
  end
  # @hospital = Hospital.find params[:hospital_id]
  # @patient = Patient.find params[:patient_id]
  # @medication = @patient.medications
  # @patient = Patient.find params[:patient_id]
  # @medication = Medication.find params[:medication_id]
end

# def add
#   @medications = Medication.all
# end

def new
  @medications = Medication.all
  @medication = Medication.new

  # @hospital = Hospital.find params[:hospital_id]
  # @patient = @hospital.patient
  # @medication = @patient.medication.new

  # @patient = Patient.find params[:patient_id]
  # @medication = @patient.medication.new
end

def create 
  # @hospital = Hospital.find params[:hospital_id]
  # @patient = @hospital.patient
  @medication = Medication.create medication_params
  redirect_to medications_path
    # if @medication.save
    #   flash[:notice] = 'Medication added.'
    #   @patient = Patient.find params[:patient_id]
    #   redirect_to hospital_patient_medications_path(@hospital,@patient,@medication)
    # else
    #   flash[:error] = 'Medication NOT added successfully'
    #   render :new
end

  # @patient = Patient.find params[:patient_id]
  # @medication = @patient.medication.create medication_params   


def show
  
  @medication = Medication.find params[:id]
end

def edit
  # @hospital = Hospital.find params[:hospital_id]
  # @patient = Patient.find params[:patient]
  @medication = Medication.find params[:id]
  # @patient = Patient.find params[:patient_id]
  # @medication = Medication.find params[:id]
end

def update
  # @hospital = Hospital.find params[:hospital_id]
  # @patient = Patient.find params[:id]
  @medication = Medication.find params[:id]
  @medication.update_attributes medication_params
  redirect_to medications_path
end

def destroy
  @medication = Medication.find params[:id]
  @medication.delete 
  redirect_to medications_path
end 
private 

  def medication_params 
    params.require(:medication).permit(
        :id,
        :name,
        :description,
        :patient_id,
        :hospital_id,
        :cost,
        :created_at,
        :updated_at,
        patient_ids: []
  )
  end
end 