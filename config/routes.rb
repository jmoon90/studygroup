Studygroup::Application.routes.draw do
  devise_scope :user do
    root to: 'devise/registrations#edit'
  end

  devise_for :users
end
