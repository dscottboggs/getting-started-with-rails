Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles

  root 'welcome#index'

  post 'auth_user' => 'authentication#authenticate_user'
  get 'test' => 'test#index'
end
