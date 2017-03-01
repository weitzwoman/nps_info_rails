Rails.application.routes.draw do
  devise_for :users
  get '/results', to: 'home#results'
  root to: 'home#index'
end
