Rails.application.routes.draw do
  
  get 'home/index'
  devise_for :users
  devise_for :admins
  authenticate :admin do #con e helper authenticate dejamos bajo la capa de autenticacion los recursos de products y categories
    resources :products
    resources :categories
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
