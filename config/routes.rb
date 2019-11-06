Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'leagues#index'
  resource :available_leagues
  post 'leagues/add_league_to_favorites'
  post 'leagues/remove_league_from_favorites'
  post 'available_leagues/add_available_league_to_leagues'
end
