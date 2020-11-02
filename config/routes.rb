Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  root to: "articles#index"

  # scope module: :apps do
  #   resouce :profile, only: [:show, :edit, :update]
  # end
  scope module: :apps do

    resource :profile, only: [:show, :edit, :update]
    resource :posts, only: [:show, :create, :destroy]
    resource :timeline, only: [:show]

  end
end
