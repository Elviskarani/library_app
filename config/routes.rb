Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users
  
  # Set root path to books index
  root "books#index"
  
  # Books routes with nested borrowings
  resources :books do
    resources :borrowings, only: [:create]
  end
  
  # Borrowings routes - for return action
  resources :borrowings, only: [] do
    member do
      patch :return_book  # For returning books
    end
  end
  
  # Profile route
  get 'profile', to: 'profiles#show'
  
  # Health check route (keep this)
  get "up" => "rails/health#show", as: :rails_health_check
end