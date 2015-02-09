class DoctorsController < ApplicationController

def index
  @doctors = Doctor.all
  @doctors = if !params[:q].blank?
    Doctor.where("name LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  else
    puts "HEY WILLIAM"
    Doctor.all
  end.shuffle
end

def new
  @doctor = Doctor.new
  @hospital = Hospital.all
end

def show
  @doctor = Doctor.find params[:id]
  # @hospitals = Hospital.all
  # @patients = Patient.all
  @rating = Rating.new 
  @ratings = @doctor.ratings
end 

def create
  @doctor = Doctor.create doctor_params
  redirect_to doctor_path(@doctor) 
end

def create_rating
  @doctor = Doctor.find params[:id]
  @rating = @doctor.ratings.create rating_params
  redirect_to doctor_path(@doctor)
end
def edit
  @doctor = Doctor.find params[:id]
  @hospitals = Hospital.all
  @patients = Patient.all 
end

def update
  @doctor = Doctor.find params[:id]
  @doctor.update_attributes doctor_params
  redirect_to doctor_path(@doctor)
end

def destroy
  @doctor = Doctor.find params[:id]
  @doctor.delete 
  redirect_to doctors_path
end

# def delete
#   @doctor = 
# end 

def doctor_params
  params.require(:doctor).permit(
    :name,
    :practice,
    :doctorable_id,
    :doctorable_type,
    doctor_ids: [],
    hospital_ids: [],
    medications_ids: []
    )


end 
end 


def rating_params
  params.require(:rating).permit(
    :score,
    :comment,
    :ratable_id,
    :ratable_type
    )
end












