# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'tests#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check

  resources :tests, shallow: true do
    resources :questions, except: :index do
      resources :answers, except: :index
    end
  end
  #    resources :questions do
  #      resources :answers do
  #      end
  #    end
  #  end

  resources :users
end
