Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :edit, :update, :destroy, :new_review ]

  get "dashboard/visitor", to: "experiences#dashboard", as: :dashboard_visitor
  get "dashboard/greeter", to: "experiences#dashboard", as: :dashboard_greeter
  get "dashboard/settings", to: "experiences#dashboard", as: :dashboard_settings
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
