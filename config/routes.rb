require 'sidekiq/web'

Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  get 'payments/create'
  mount ForestLiana::Engine => '/forest'
  resources :payments, only: [:index, :new, :create]
  resources :jobs do
    resources :job_applications
  end

  devise_for :users
  root to: 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
