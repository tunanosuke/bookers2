Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :edit, :update, :show]
  resources :books, only: [:index, :create, :edit, :update, :show, :destroy]
  resource :about, only: [:show]
end
