Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
  root "cost#index"
  resources :cost, only: [:index]
end
