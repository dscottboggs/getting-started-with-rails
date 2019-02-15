Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  resources :attached_images

  get "sign_in" => "users#new"
  get "sign_out" => "users#destroy"
  resources :users do
    resources :articles do
      resources :attached_images, except: [ :edit, :update ]
    end
  end

  root 'welcome#index'
end
