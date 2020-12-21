Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :professors, controllers: {
    sessions:      'professors/sessions',
    passwords:     'professors/passwords',
    registrations: 'professors/registrations'
  }
  
  scope :professors do
    resources :professors
    resources :lectures
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  scope :users do
    get 'subjects/search'
    resources :subjects 
    resources :schedules
  end

  
end
