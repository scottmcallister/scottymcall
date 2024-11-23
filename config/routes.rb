Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  get "articles" => "article#index", as: :articles
  get "articles/test" => "article#test", as: :test
  get "articles/:id" => "article#show", as: :article

  get "dashboard", to: "dashboard#index"
  get "dashboard/new", to: "dashboard#new"
  post "dashboard/create", to: "dashboard#create"
  get "dashboard/:id/edit", to: "dashboard#edit", as: "edit_dashboard"
  patch "dashboard/:id", to: "dashboard#update"
  put "dashboard/:id", to: "dashboard#update"
end
