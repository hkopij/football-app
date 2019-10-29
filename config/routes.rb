Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'leagues#index'
  post 'leagues/add_league_to_favorites'
  post 'leagues/remove_league_from_favorites'
end
