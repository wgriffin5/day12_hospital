class Patient < ActiveRecord::Base
validates :first_name, presence: true
validates :last_name, presence: true
validates :date_of_birth, presence: true
validates :description, presence: true

belongs_to :hospital 
  # has_many :medications
  has_many :doctors, through: :patient_doctors
  has_many :patient_doctors

BLOOD_TYPE_OPTIONS = [
  "A+",
  "A-",
  "B+",
  "B-",
  "O+",
  "O-",
  "AB+",
  "AB-",

]
  
end
