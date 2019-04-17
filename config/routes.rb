Rails.application.routes.draw do

  root to: 'pages#home'


   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create] do

      resources :scans, only: [:index, :show]

      resources :foods, only: [:create]

      resources :favorites, only: [:create, :index, :show, :destroy]

      end

    end
  end
end

