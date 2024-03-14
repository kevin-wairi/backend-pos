Rails.application.routes.draw do
  resources :product_variants
  resources :transaction_records
  resources :categories
  resources :customers
  post "/login", to: "auth#create"
  resources :employees, only: [:index, :show, :update, :delete]
  resources :transaction_details
  resources :products
  resources :suppliers
  resources :inventories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
