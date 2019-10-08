Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create] do 
    resources :posts, only: [:edit, :update, :create, :index]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] do
    resources :posts, except: [:index, :edit, :update, :create]
  end
end

