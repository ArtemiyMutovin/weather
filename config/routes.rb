Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weather, only: %i[current historical by_time] do
        get :current, on: :collection
        get :historical, on: :collection
        get :by_time, on: :collection
      end
      namespace :weather do
        resources :historical, only: %i[max min avg] do
          get :max, on: :collection
          get :min, on: :collection
          get :avg, on: :collection
        end
      end
      resources :health, only: :index
    end
  end
end
