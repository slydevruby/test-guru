# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  devise_for :users

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
