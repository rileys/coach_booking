Rails.application.routes.draw do
  root 'coaches#index'

  resources :coaches, only: :index do
    member do
      get :calendar
    end
  end
end
