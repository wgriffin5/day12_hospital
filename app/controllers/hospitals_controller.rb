class HospitalsController < ApplicationController

def index
  @hospitals = Hospital.all
  @medications = Medication.all

end 

def new
  @hospital = Hospital.new
  @doctors = Doctor.all
  
  end

def create 
  @hospital = Hospital.create hospital_params
  redirect_to hospitals_path
end 

def create_rating
  @hospital = Hospital.find params[:id]
  @rating = @hospital.ratings.create rating_params
  redirect_to hospital_path(@hospital)
end


def show 
  @hospital = Hospital.find params[:id]
  @doctors = @hospital.doctors
  @ratings = @hospital.ratings
  @rating = Rating.new
end 


def edit
  @hospital = Hospital.find params[:id]
  @doctors = Doctor.all
end

def update
  @hospital = Hospital.find params[:id]
  @hospital.update_attributes hospital_params
  redirect_to hospital_path(@hospital)
end

def destroy 
  @hospital = Hospital.find params[:id]
  @hospital.delete
  redirect_to hospitals_path
end

def create_rating
  params.require(:rating).permit(
    :score,
    :comment,
    :ratable_id,
    :ratable_type
    )
end

  private 
  def hospital_params
    params.require(:hospital).permit(
    :name,
    :address,
    :city,
    :state,
    :zip,
    :specialty,
    hospital_ids: [],
    doctor_ids: []
    )
end
end 