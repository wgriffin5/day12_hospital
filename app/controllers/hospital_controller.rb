class HospitalController < ApplicationController

def index 
  @patients = Patient.all
  
end


end


