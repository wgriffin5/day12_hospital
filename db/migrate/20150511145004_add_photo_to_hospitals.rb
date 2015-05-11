class AddPhotoToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :photo, :string
  end
end
