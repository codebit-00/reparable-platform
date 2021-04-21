Rails.application.routes.draw do
  devise_for :users

  resources :reparation_requests, except: %i[edit destroy]

  root 'reparation_requests#new'
end
