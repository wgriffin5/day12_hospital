class Doctor < ActiveRecord::Base
  # belongs_to :patients, polymorphic: true 
  belongs_to :hospitals, polymorphic: true
  has_many :patients, through: :patient_doctors
  has_many :patient_doctors
  has_many :hospital_doctors
  has_many :ratings, as: :ratable
  
end
