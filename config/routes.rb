Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users, controllers: { registrations: 'users/registrations' }

    get 'profile', to: 'users#show'
    resources :inscriptions, except: [:show, :destroy]
    resources :courses, only: [:index, :show]
    resources :course_modules, only: [:show, :destroy] do
      resources :quizzes
    end
    resources :quizzes, only: [:show, :destroy] do
      resources :questions
    end
    resources :questions, only: [:show, :destroy] do
      resources :answers
    end
    namespace :teachers do
      resources :courses, only: [:index] do
        resources :inscriptions, only: [:index]
      end
    end
    namespace :students do
      resources :courses, only: [:index, :show]
      resources :course_modules, only: [:show]
    end

    root 'welcome#index'
  end
end
