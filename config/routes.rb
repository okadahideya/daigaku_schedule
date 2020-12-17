Rails.application.routes.draw do
  devise_for :users
  root to: "subjects#index"
  get 'subjects/search'
  resources :subjects 
  resources :schedules
end
