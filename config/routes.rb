Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'hospital#index'
  resources :hospitals do
    member do
      post :create_rating
    end 
    resources :patients do
      member do
        patch :patient_waiting
        patch :patient_checking_up
        patch :patient_x_raying
        patch :patient_surged
        patch :patient_billing
        patch :leaving
      end
      collection do
        get :search_results
      end
    end
  end

  resources :medications
  
  resources :doctors do
    member do
      post :create_rating
    end
  end
end
  
  

  
  

