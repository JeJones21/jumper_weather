Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :activities, only: :index
      resources :backgrounds, only: :index
      resources :sessions, only: :create
      resources :users, only: :create
    end
  end
end
