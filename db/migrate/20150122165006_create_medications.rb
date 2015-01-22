class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :description
      t.string :patient_id
      t.string :hospital_id
      t.float :cost

      t.timestamps null: false
    end
  end
end
