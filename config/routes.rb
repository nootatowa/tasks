Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :users,only:[:edit,:update]
  resources :list, only: [:new,:create,:edit,:update,:destroy]do
  resources :cards,only:[:new,:create,:show,:edit,:update]
end
end


