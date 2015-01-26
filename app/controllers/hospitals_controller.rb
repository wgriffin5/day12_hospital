class HospitalsController < ApplicationController

def index
  @hospitals = Hospital.all

end 

def new
  @hospital = Hospital.new
  @doctors = Doctor.all
  end

def create 
  @hospital = Hospital.create hospital_params
  redirect_to hospitals_path
end 

def show 
  @hospital = Hospital.find params[:id]
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

  private 
  def hospital_params
    params.require(:hospital).permit(
    :name,
    :address,
    :city,
    :state,
    :zip,
    :specialty
    )
end
end 