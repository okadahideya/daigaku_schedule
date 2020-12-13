Rails.application.routes.draw do
  devise_for :users
  root to: "subjects#index"
  get 'subjects/search'
  resources :users do
    get 'search'
  end
  resources :subjects
end
