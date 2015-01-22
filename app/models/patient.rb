class Patient < ActiveRecord::Base
validates :first_name, presence: true
validates :last_name, presence: true
validates :date_of_birth, presence: true
validates :description, presence: true

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
  has_and_belongs_to_many :hospitals 
  has_and_belongs_to_many :medications
end
