task create_patients: :environment do 
  90.times do
      Patient.create!({
        first_name: "#{Faker::Name.first_name}",
        last_name: "#{Faker::Name.last_name}",
        date_of_birth: "#{Faker::Date.backward(10000)}",
        description: "#{Faker::Lorem.sentence}",
        blood_type: "B+",
        workflow_state: "Goner",
        hospital_ids: "3"
        })
  end
  
end


