Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :road_trip, only: :create
      resources :sessions, only: :create
      resources :users, only: :create
      resources :forecast, only: :index
    end
  end
end
