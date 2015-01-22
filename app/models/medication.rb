class Medication < ActiveRecord::Base
# belongs_to :hospital
# belongs_to :patient
has_and_belongs_to_many :patients
end
