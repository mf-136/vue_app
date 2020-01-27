Rails.application.routes.draw do
  root to: 'home#index'
  
  # /users: index,create
  # /users/:id: show,update,destroy
  # /users/new: new
  # /users/:id/edit: edit
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :microposts, only: [:index,:show, :create, :destroy]
    end
  end

  
end

