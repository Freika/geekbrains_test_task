# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'courses#index'

  resources :users, except: %i[index destroy]
  resources :sessions, only: %i[new create destroy]
  get 'signup',     to: 'user#new', as: 'signup'
  get 'login',      to: 'sessions#new', as: 'login'
  delete 'logout',  to: 'sessions#destroy', as: 'logout'

  resource :courses, only: %i[index show]
end
