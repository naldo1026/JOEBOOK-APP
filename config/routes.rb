Rails.application.routes.draw do
  devise_for :users
  post "/covers/accept", to: "covers#accept"


  root to: 'pages#home'
  resources :posts do
    resources :comments
  end

  resources :covers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
