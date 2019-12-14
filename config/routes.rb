# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users,  only: [:show, :index] do
    resource :following, only: [:show, :create, :destroy], controller: "user/following"
    resource :follower, only: [:show], controller: "user/follower"
  end
  root "books#index"
  resources :books
  resources :reports, shallow: true do
    resources :comments, only: [:create, :edit, :update, :destroy], module: "report"
  end
end
