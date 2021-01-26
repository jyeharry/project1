Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]
  resources :bars, :only => [:new, :create, :index]

  get '/bars/saved' => 'bars#saved'
  post '/bars/search' => 'bars#search'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
