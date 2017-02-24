Rails.application.routes.draw do
  root :to => 'users#index'
  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end
   
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
