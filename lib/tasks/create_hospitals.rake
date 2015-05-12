task create_hospitals: :environment do 
  20.times do
    Hospital.create!({
      name: "#{Faker::Company.name}",
      address: "#{Faker::Address.street_address}",
      city: "#{Faker::Address.city}",
      state: "#{Faker::Address.state}",
      photo: 

      })
  end
  
end