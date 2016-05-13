Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/store' => 'products#index'

  get '/store/new' => 'products#new'
  post '/store' => 'products#create'

  get '/store/:id' => 'products#show'

end
