Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  root to: "articles#index"

  # scope module: :apps do
  #   resouce :profile, only: [:show, :edit, :update]
  # end

  
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  
  scope module: :apps do
    resource :profile, only: [:show, :edit, :update]
    resources :timelines, only: [:index, :show, :new, :create, :destroy]
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  namespace :api, defaults: {format: :json} do

    scope '/posts/:post_id' do

      resources :comments, only: [:index, :create]
    end
  end


end
