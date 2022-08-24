Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :places do
    resources :projects, only: [:new, :create, :destroy] do
      member do
        patch :accept
      end

    end
  end
  get 'profile', to: 'pages#profile'
  # Defines the root path route ("/")
  # root "articles#index"
end
