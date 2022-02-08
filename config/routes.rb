Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
  root "group#index"
  resources :users
  resources :cost, only: [:index]
  resources :group, only: [:index, :new]
end
