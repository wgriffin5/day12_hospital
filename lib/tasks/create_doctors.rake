task create_doctors: :environment do
  50.times do 
    Doctor.create!({
      name: "#{Faker::Name.name}",
      practice: "#{Faker::Name.title}",
      photo: "http://placecreature.com/200/200"
      })
    
  end
  
end