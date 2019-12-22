Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'courses#index'

  # root to: redirect(courses_path)

  resources :courses, only: [:index, :show] do
    resources :groups do
      resources :users, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
