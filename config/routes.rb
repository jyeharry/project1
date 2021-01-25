Rails.application.routes.draw do
  get 'bars/index'
  get 'bars/new'
  get 'sessions/new'
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]

  resources :mixtapes, :only => [:new, :create]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
