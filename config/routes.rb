# frozen_string_literal: true

Rails.application.routes.draw do
  resources :landing, only: [:index, :show]

  resources :loan_types
  resources :documents
  resources :loans

  root 'loans#index'
end
