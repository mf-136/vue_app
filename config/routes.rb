Rails.application.routes.draw do

  
  root to: 'home#index'
  
#, only: [:index, :show]
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users
        # /users: index,create
        # /users/:id: show,update,destroy
        # /users/new: new
        # /users/:id/edit: edit
    end
  end

  
end

