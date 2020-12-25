Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :professors, controllers: {
    sessions:      'professors/sessions',
    passwords:     'professors/passwords',
    registrations: 'professors/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  scope :professors do
    resources :professors
    resources :lectures do
      resources :lecture_details do
        member do
         get :download
        end
      end
    end
  end

  

  scope :users do
    get 'subjects/search'
    resources :subjects 
    resources :schedules
  end

  
end
