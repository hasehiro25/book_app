# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users,  only: [:show, :index] do
    resource :following, only: [:show, :create, :destroy], controller: "user/following"
  end
  root "books#index"
  resources :books
end
