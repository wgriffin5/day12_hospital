class MedicationsController < ApplicationController
end

def index
end

def new
end

def create
end

def show
end

def edit
end

def medication_params 
  params.require(:medication).permit(
      :name,
      :description,
      :price,
)
end