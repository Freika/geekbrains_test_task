# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'courses#index'

  resources :users, except: %i[index destroy]
  resources :sessions, only: %i[new create destroy]

  get     'signup', to: 'users#new',        as: 'signup'
  get     'login',  to: 'sessions#new',     as: 'login'
  delete  'logout', to: 'sessions#destroy', as: 'logout'

  resources :courses, only: %i[index show] do
    post    'groups/:group_id/join',  to: 'courses/participations#create',   as: :join
    delete  'groups/:group_id/leave', to: 'courses/participations#destroy',  as: :leave
  end
end
