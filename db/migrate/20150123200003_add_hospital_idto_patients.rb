class AddHospitalIdtoPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :hospital_id, :string
  end
end
