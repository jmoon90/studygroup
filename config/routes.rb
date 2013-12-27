Studygroup::Application.routes.draw do
  devise_scope :user do
    root to: 'devise/registrations#edit'
  end

  devise_for :users

  resources :groups, only: [:index, :show, :new, :create]
end
