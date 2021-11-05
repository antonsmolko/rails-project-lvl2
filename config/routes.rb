# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts do
    member do
      resources :post_comments, only: %w[create new], shallow: true
      resources :post_likes, only: %w[create destroy], shallow: true
    end
  end
end
