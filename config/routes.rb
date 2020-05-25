Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :fish, only: [:index, :create, :update, :show, :destroy]
      resources :reviews, only: [:index, :create, :update, :show, :destroy]
      resources :favorites, only: [:create, :destroy]
      resources :fish_spot, only: [:create, :destroy]
      resources :fishing_spots, only: [:index, :create, :update, :show, :destroy]
      resources :users, only: [:index, :create, :update, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
