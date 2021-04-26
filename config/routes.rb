Rails.application.routes.draw do
  devise_for :users

  resources :reparation_requests, except: %i[edit destroy]

  resources :reparation_requests do
    member do
      patch :change_status
    end
  end

  get '/reparation_requests' => 'reparation_requests#index', :as => :user_root

  root 'reparation_requests#new'
end
