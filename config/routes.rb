Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users, controllers: { registrations: 'users/registrations' }

    get 'profile', to: 'users#show'
    resources :people, only: [:index, :show, :create, :destroy]
    resources :inscriptions, only: [:index, :show, :create, :destroy]
    resources :courses, only: [:index, :show] do
      post :inscriptions, to: 'inscriptions#create'
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
      resources :courses, only: [:index, :show, :edit, :update] do
        resources :inscriptions, only: [:index]
        resources :course_modules, only: [:edit, :update, :show, :destroy] do
          resources :quizzes
        end
      end
    end
    namespace :students do
      resources :courses, only: [:index, :show]
      resources :course_modules, only: [:show, :destroy] do
        resources :quizzes
      end
      resources :inscriptions, only: [:index]
    end
    namespace :guests do
      resources :courses, only: [:index, :show]
    end
   
    root 'welcome#index'
  end
end
