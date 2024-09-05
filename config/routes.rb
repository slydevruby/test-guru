# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rules

  resources :badges do
    member do
      delete :remove_image
    end
  end

  root 'tests#index'

  get :feedbacks, 'feedbacks/new'
  post :feedbacks, 'feedbacks/create'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index, shallow: true do
    member do
      post :start
    end
  end

  resources :passages, only: %i[show update] do
    member do
      get :result
      post :gist, to: 'admin/gists#create'
    end
  end

  namespace :admin do
    resources :categories
    resources :gists, only: :index
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end
end
