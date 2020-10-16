# frozen_string_literal: true

Rails.application.routes.draw do
  resources :journals
  resources :notes
  resources :to_dos
  resources :users, only: %i[show create]
  get '/user_journals/:id', to: 'journals#user_journals'
  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
