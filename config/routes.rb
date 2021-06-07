# frozen_string_literal: true

Rails.application.routes.draw do
  resources :loan_types
  resources :documents
  resources :loans

  root 'loans#index'
end
