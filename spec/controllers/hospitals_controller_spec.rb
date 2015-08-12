require 'rails_helper'
require 'spec_helper'

describe HospitalsController do 

  let(:hospital) {
    Hospital.create({

      name: "test name hospital",
      address: "test address",
      city: "test city",
      state: "test state",
      zip: "12345",
      specialty: "test specialty"

      })
  }

  let(:rating) {
    hospital.ratings.create({

    })
  }

    describe 'GET #index' do
      let!(:hospitalA){
        Hospital.create({

          name: "TESTA",
          address: "test",
          city: "test",
          state: "test",
          zip: "12345",
          specialty: "test"
          })
      }

      let!(:hospitalA){
        Hospital.create({

          name: "TESTB",
          address: "test",
          city: "test",
          state: "test",
          zip: "12345",
          specialty: "test"
          })
      }

      let!(:hospitalA){
        Hospital.create({

          name: "TESTC",
          address: "test",
          city: "test",
          state: "test",
          zip: "12345",
          specialty: "test"
          })
      }

      it 'should find all these hospitals' do
        get :index
        expect(assigns(:hospitals).first.name).to eq hospital.name
      end

    end



    describe 'GET #show' do
      it 'should show a single hospital instance' do
        get :show, id: hospital.id 
        expect(assigns(:hospital)).to eq hospital
      end
    end


    describe 'GET #new' do
      it 'should init a new hospital' do
        get :new
        expect(assigns(:hospital).class).to eq Hospital
        expect(assigns(:hospital).new_record:).to eq true
      end
    end

    describe 'POST #create' do
      it 'should create a new hospital' do
        post :create, hospital: {name: "TEST name"}
        expect(assigns(:hospital).class).to eq Hospital
      end
    end

    describe 'GET #edit' do 
      it 'should find the hospital with correct id' do
        get :edit, id: hospital.id
        expect(assigns(:hospital)).to eq hospital
      end
    end

    describe 'PATCH #update' do
      it 'should update hospital city' do 
        patch :update, id: hospital.id, hospital: { name: "test name", address: "test", city: "city", state: "test", zip: "12345"
        }
        expect(assigns(:hospital).city).to eq "city"
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete dat hospital' do
        delete :destroy, id: hospital.id
        expect(assigns(:hospital).id).to eq hospital.id
      end
    end

end

















