Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
              controllers: {omniauth_callbacks: "omniauth_callbacks"}

  get 'auth/:provider/callback', to: 'sessions#create'
   get 'auth/failure', to: redirect('/')
   get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :articles

  resources :articles do
    resources :comments
  end

  root to: 'articles#index'
  # root to: 'articles#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
