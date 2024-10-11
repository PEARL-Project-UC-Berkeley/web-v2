Rails.application.routes.draw do
  get 'home/index'
  root 'experiments#index'
  
  resources :experiments do
    resources :controls
    resources :components
    resources :camera_streams
  end

  resources :appointments do
    collection do
      get "admin", to: "appointments#admin"
    end
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
