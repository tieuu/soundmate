Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :equipment, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :show, :create, :edit, :update]
  end
end
