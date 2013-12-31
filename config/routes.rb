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

  resources :posts, only: [:show ,:new, :create]
end
