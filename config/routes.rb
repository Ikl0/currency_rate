# frozen_string_literal: true

Rails.application.routes.draw do
  resources :currencies, only: %i[index show] do
    collection do
      get :weekly_rates
    end
  end
  root 'currencies#index'
end
