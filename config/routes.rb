Rails.application.routes.draw do
  root 'coaches#index'

  resources :coaches, only: :index
end
