Rails.application.routes.draw do

 devise_for :users


  root to: "listings#index"
  resources :listings
  resources :pets

  resources :listings do
    resources :bookings, only: [:new, :show, :create]
  end

  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
