Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :tracks do
        collection do
          get :cherry_red
          get :random
          get :search
        end
      end
    end
  end
end
