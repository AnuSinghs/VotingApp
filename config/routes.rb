# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
Rails.application.routes.draw do
  root "campaigns#index"

  resources :campaigns, only: [:index, :show, :create] do
    get 'votes', on: :member
  end

  post 'campaigns/import_votes', to: 'campaigns#import_votes', as: 'import_votes'
end