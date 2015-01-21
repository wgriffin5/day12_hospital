class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.text :first_name
      t.text :last_name
      t.date :date_of_birth
      t.text :description

      t.timestamps null: false
    end
  end
end
