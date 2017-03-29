Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users, controllers: { registrations: 'users/registrations' }

    get 'profile', to: 'users#show'
    resources :inscriptions, except: [:show, :destroy]
    resources :courses do
      resources :course_modules, except: [:show, :destroy]
    end
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
      resources :courses, only: [] do
        resources :inscriptions, only: [:index]
      end
    end

    root 'welcome#index'
  end
end
