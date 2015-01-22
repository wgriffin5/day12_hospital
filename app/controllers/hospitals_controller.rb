class HospitalsController < ApplicationController

def index
  @hospitals = Hospital.all

end

def new
  end

def edit
  @hospital = Hospital.find params [:id]
end

def update
  @hospital
end

def destroy
  redirect_to  
end

  private 
  def hospital_params
    params.require(hospital).permit
    :name,
    :address,
    :city,
    :state,
    :zip,
    :specialty
    )
end
end 