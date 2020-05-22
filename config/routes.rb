Rails.application.routes.draw do
  resources :fish_spots
  resources :fish
  resources :reviews
  resources :favorites
  resources :fishing_spots
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
