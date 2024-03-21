# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  devise_for :users

  resources :tests, only: :index, shallow: true do
    member do
      post :start
    end
  end

  resources :passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
