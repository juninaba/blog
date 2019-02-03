Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  resources :articles do
    resources :comments, only: [:create]
  end

  resources :users do
    #ユーザーidが含まれているURLを扱う
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

end
