Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/store' => 'products#index'

  get '/store/random' => 'products#random'

  get '/store/new' => 'products#new'
  post '/store' => 'products#create'

  get '/store/:id' => 'products#show'

  get '/store/:id/edit' => 'products#edit'
  patch '/store/:id' => 'products#update'

  delete '/store/:id' => 'products#destroy'

  get '/suppliers/new' => 'products#new'
  post '/suppliers' => 'products#create'

  get '/suppliers/:id' => 'suppliers#show'


end
