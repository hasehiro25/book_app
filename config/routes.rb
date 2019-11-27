# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}
  root "books#index"
  resources :books
end
