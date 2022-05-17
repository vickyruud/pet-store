Rails.application.routes.draw do

  # home page to show all products
  root to: 'products#index'
  
  # product routes
  resources :products 
end
