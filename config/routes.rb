require 'sidekiq/web'

Rails.application.routes.draw do
  get '/payment_success', to: 'jobs#ezcount_charge_verify', :template => 'pages/thank_you', :defaults => { :format => 'json' }
  get '/dashboard', to: 'jobs#dashboard', :template => 'jobs/dashboard'
  get '/pages/:page' => 'pages#show'

  mount ForestLiana::Engine => '/forest'
  resources :jobs do
    resources :job_applications
    member do
      get :payment_success, to: 'jobs#ezcount_charge_verify'
    end
  end

  devise_for :users
  root to: 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
