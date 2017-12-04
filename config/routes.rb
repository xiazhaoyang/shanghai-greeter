Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :edit, :update, :destroy, :new_review ]

  get "dashboard/visitor", to: "dashboard#visitor"
  get "dashboard/greeter", to: "dashboard#greeter"
  get "dashboard/settings", to: "dashboard#settings"
  get "dashboard", to: "dashboard#index"
  get "/become-a-greeter", to: "pages#greeter"
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
