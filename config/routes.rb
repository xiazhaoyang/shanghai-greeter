Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :edit, :update, :destroy, :new_review ]

  get "dashboard", to: "experiences#dashboard", as: :dashboard
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
