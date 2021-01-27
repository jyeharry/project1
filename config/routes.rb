Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :bars, :only => [:new, :create, :index]

  post '/users/save' => 'users#save'
  post '/users/unsave' => 'users#unsave'
  
  post '/bars/search' => 'bars#search'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
