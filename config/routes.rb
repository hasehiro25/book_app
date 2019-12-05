# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users,  only: [:show, :index]
  root "books#index"
  resources :books
end
