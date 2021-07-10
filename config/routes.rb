Rails.application.routes.draw do
  devise_for :farmers, controllers: {
    sessions: 'farmers/sessions',
    passwords: 'farmers/passwords',
    registrations: 'farmers/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "items#index" 
  resources :items do
    resources :purchase_items, only: [:index, :create]
  end
end
