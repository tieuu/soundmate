Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index, :show, :create, :edit, :update]
  resources :equipments, only: [:index, :show, :new, :create]

end
