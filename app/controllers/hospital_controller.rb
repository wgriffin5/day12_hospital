class HospitalController < ApplicationController

  # before_filter :disable_nav, only: [:landing_page]

  def index 
    @patients = Patient.all
    @disable_nav = true
  end

end