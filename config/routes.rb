Rails.application.routes.draw do
  resources :job_ads, only: [:show, :create, :new, :index, :edit, :update, :destroy]
  resources :job_applications, only: [:create, :new]

  root 'job_ads#index'
  devise_for :users
end
