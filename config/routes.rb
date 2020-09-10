# frozen_string_literal: true

Rails.application.routes.draw do
  resources :journals
  resources :notes
  resources :to_dos
  resources :users, only: :show
  get '/user_journals/:id', to: 'journals#user_journals'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
