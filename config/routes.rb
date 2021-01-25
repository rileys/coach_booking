Rails.application.routes.draw do
  root 'coaches#index'

  resources :coaches, only: :index do
    member do
      get :calendar
      get 'availability_for_date/:date', action: :availability_for_date, as: :availability_for_date
    end

    resources :appointments, only: [:new, :create]
  end
end
