Studygroup::Application.routes.draw do
  root to: 'groups#index'

  devise_for :users

  resources :groups, only: [:index, :show, :new, :create] do
    get 'join'
    get 'leave'
  end
  resources :tutorials, only: [:new, :create]
end
