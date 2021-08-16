Rails.application.routes.draw do
  root to: 'products#landing'

  get '/signup' => 'users#new'
  get '/users' => 'users#edit' 
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :products do
    resources :reviews
  end
end
