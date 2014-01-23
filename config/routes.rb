Studygroup::Application.routes.draw do
  require 'sidekiq/web'
  require 'sidetiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
  root to: 'home#index'
  devise_for :users

  resources :groups, only: [:index, :show, :new, :create] do
    collection do
      get 'mygroup'
    end
    resources :posts, only: [:index]
    resources :memberships, only: [:create, :destroy]
  end

  resources :tutorials, only: [:new, :create]

  resources :posts, only: [:show], has_many: :tags do
    resources :taggings, only: [:create]
    resources :comments, only: [:create], has_many: :tags
    collection do
      get 'new/:id', to: 'posts#new', as: 'new'
      post ':id', to: 'posts#create', as: ''
    end
  end

  resources :messages, only: [:new,:create]

  resources :learnings, only: [:index, :show, :new, :create, :edit, :update] do
    resources :votes, only: [:create, :destroy]
  end


  resources :home, only: [:index]
  resources :about, only: [:index]
  resources :tips, only: [:index]
end
