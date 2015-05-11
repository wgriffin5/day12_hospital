task create_doctors: :environment do
  50.times do 
    Doctor.create!({
      name: "#{Faker::Name.name}",
      practice: "#{Faker::Name.title}",
      photo: "#{Faker::Avatar.image}"
      })
    
  end
  
end