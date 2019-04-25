Rails.application.routes.draw do

  root to: 'pages#home'


   namespace :api, defaults: { format: :json } do
    namespace :v1 do

      # resources :sessions, only: [:create]

      resources :users, only: [:create] do

        resources :scans, only: [:index, :show, :create] do
          collection do
            get :statisitics
          end
        end


      resources :foods, only: [:create, :show]

      resources :favorites, only: [:create, :index, :show, :destroy]

      resources :propositions, only: [:create]


      end

    end
  end
end

