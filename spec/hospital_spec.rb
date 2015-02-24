require 'rails-helper'

RSpec.describe Hospital, type: :model do
  subject do 
    Hospital.new({
      name: "Some Hospital",
      address: "We heal patients",
      city: "NY",
      state: "NY",
      zip: "90210",
      specialty: "ebola"
      })
end