# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
Rails.application.routes.draw do
  root "campaigns#index"

  resources :campaigns, only: [:index, :show] do
    member do
      get :votes
    end
    collection do
      post :import_votes
    end
  end
end

