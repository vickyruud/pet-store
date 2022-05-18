Rails.application.routes.draw do

  # home page to show all products
  root to: 'products#index'

  get '/show_deleted', to: 'products#show_deleted'
  # put '/products/undelete/:id'=> 'products#undelete', :as => 'undelete_product'
    
  # product routes
  resources :products  do
    put 'undelete/:id', to: 'products#undelete', :as => 'undelete'
    get 'delete_comments/:id', to:'products#add_delete_comment_form', :as => 'delete_comment'

  end


end
