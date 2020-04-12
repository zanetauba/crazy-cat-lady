Rails.application.routes.draw do

  devise_for :users


  root to: "listings#index"
  resources :listings do
    resources :listing_photos
  end

  resources :listing_photos
  resources :pets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
