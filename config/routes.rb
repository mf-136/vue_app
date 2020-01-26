Rails.application.routes.draw do

  
  root to: 'home#index'
  
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
        # /users: index,create
        # /users/:id: show,update,destroy
        # /users/new: new
        # /users/:id/edit: edit
      resources :microposts,          only: [:create, :destroy]
    end
  end

  
end

