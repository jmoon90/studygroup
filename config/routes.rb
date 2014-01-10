Studygroup::Application.routes.draw do
  root to: 'groups#index'

  devise_for :users

  resources :groups, only: [:index, :show, :new, :create] do
    collection do
      get 'mygroup'
    end
    resources :memberships, only: [:create, :destroy]
  end

  resources :tutorials, only: [:new, :create]

  resources :posts, only: [:show] do
    resources :comments, only: [:create]
    collection do
      get 'new/:id', to: 'posts#new', as: 'new'
      post ':id', to: 'posts#create', as: ''
    end
  end

  resources :messages, only: [:create, :new]

  resources :home, only: [:index]
end
