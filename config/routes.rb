Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  localized do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    
    resources :courses do
      resources :course_modules, except: [:show, :destroy]
      resources :inscriptions, except: [:show, :destroy]
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

    root 'welcome#index'
  end
end
