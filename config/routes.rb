Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
 
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  resources :group, only: [:index, :new, :create] do
    resources :cost, only: [:index, :new, :create]
  end
end
