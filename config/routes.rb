Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles

  get "sign_in" => "users#new"
  get "sign_out" => "users#destroy"
  resources :users

  root 'welcome#index'
end
