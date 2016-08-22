Rails.application.routes.draw do
 
  root 'products#index' #Especifica la raiz del proudcto

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #---------------------------------------------------------
  #get '/products' , to: 'products#index'
  #get '/products/new' , to: 'products#new', as: 'new_product'
  #post '/products', to: 'products#create'
  #get '/products/:id', to: 'products#show', as: 'product'
  #get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  #patch '/products/:id', to: 'products#update'
  #delete '/products/:id', to: 'products#destroy'
  #----------------------------------------------------------
  resources :users, only: [:new, :create] #El usuario solo tiene acceso a estos dos metodos
  resources :products
  
end
