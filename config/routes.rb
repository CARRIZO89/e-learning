Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :teachers
  
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

  devise_for :users
  root 'welcome#index'

  namespace :admin do
    resources :dashboard
    end
end
