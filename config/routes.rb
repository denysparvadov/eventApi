Rails.application.routes.draw do


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :events
      resources :users, :only => [:show, :create, :update, :destroy, :index]
      resources :sessions, :only => [:create, :destroy]

    end
  end
end
