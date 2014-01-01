Studygroup::Application.routes.draw do
  root to: 'groups#index'

  devise_for :users

  resources :groups, only: [:index, :show, :new, :create] do
    get 'join'
    get 'leave'
    collection do
      get 'mygroup'
    end
  end

  resources :tutorials, only: [:new, :create]

  resources :posts, only: [:show] do
    collection do
      get 'new/:id', to: 'posts#new', as: 'new'
      post ':id', to: 'posts#create', as: ''
    end
  end
end
