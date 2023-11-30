Rails.application.routes.draw do
  resources :currencies, only: [:index, :show] do
    collection do
      get :weekly_rates
    end
  end
  root "currencies#index"
end
