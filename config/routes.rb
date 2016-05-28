Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/store' => 'products#index'

  get '/store/random' => 'products#random'

  get '/store/new' => 'products#new'
  post '/store' => 'products#create'

  get '/store/:id' => 'products#show'

  get '/store/:id/edit' => 'products#edit'
  patch '/store/:id' => 'products#update'

  delete '/store/:id' => 'products#destroy'

  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get '/suppliers/:id' => 'suppliers#show'

  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch '/suppliers/:id' => 'suppliers#update'

  delete '/suppliers/:id' => 'suppliers#destroy'

  get '/orders/:id' => 'orders#show'

  post '/orders' => 'orders#create'

  post '/cart' => 'carted_products#create'
  get '/cart' => 'carted_products#show'

end
