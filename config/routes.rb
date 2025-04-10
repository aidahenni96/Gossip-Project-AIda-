Rails.application.routes.draw do
  get "gossips/index"
  get "gossips/new"
  get "gossips/create"
  get "gossips/show"
  get "gossips/edit"
  get "gossips/update"
  get "gossips/destroy"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/create"
  get '/favicon.ico', to: redirect('/assets/favicon.ico')
  get '/robots.txt', to: redirect('/assets/robots.txt')
  get '/humans.txt', to: redirect('/assets/humans.txt')
  get '/sitemap.xml', to: redirect('/assets/sitemap.xml')
  get '/apple-touch-icon.png', to: redirect('/assets/apple-touch-icon.png')
  get '/browserconfig.xml', to: redirect('/assets/browserconfig.xml')
  get '/manifest.json', to: redirect('/assets/manifest.json')
  get '/service-worker.js', to: redirect('/assets/service-worker.js')
  get '/sw.js', to: redirect('/assets/sw.js')
  get '/sw.js.map', to: redirect('/assets/sw.js.map')
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips
  root 'gossips#index'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'gossips/:id/edit', to: 'gossips#edit', as: 'edit_gossip'
  patch 'gossips/:id', to: 'gossips#update'
  delete 'gossips/:id', to: 'gossips#destroy', as: 'delete_gossip'
  post 'gossips/:id/comments', to: 'comments#create', as: 'gossip_comments'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end


