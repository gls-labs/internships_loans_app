# frozen_string_literal: true

Rails.application.routes.draw do
  get 'landing' => 'landing#index'

  resources :loan_types
  resources :documents
  resources :loans

  root 'loans#index'
end
