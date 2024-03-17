# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check

  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, except: :index
    end

    member do
      post :start
    end
  end

  resources :passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
