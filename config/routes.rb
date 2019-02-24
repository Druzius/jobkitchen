require 'sidekiq/web'

Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  resources :jobs do
    resources :job_applications
  end

  Rails.application.routes.draw do
    get '/pages/:page' => 'pages#show'
  end

  devise_for :users
  root to: 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
