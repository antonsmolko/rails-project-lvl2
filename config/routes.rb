# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts do
    resources :post_comments
    resources :post_likes, only: %w[create destroy]
  end
end
