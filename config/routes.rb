Rails.application.routes.draw do
  resources :bookings
  resources :coupons
  resources :movies
  resources :screens
  resources :theatres
  devise_for :users
  
  resources :theatres do
    resources :screens
  end
  resources :screens do
    resource :movies
  end
  resources :movies do
    resources :coupons
  end
  resources :movies do
    resources :bookings    
  end
  root 'home#index'

end
