# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts do
    member do
      resources :post_comments, shallow: true
      resources :post_likes, only: %w[create]
      delete 'post_likes', to: 'post_likes#destroy'
    end
  end
  # delete 'posts/:id/post_likes', to: 'post_likes#destroy', as: 'post_like_destroy'
end
