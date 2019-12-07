Rails.application.routes.draw do
  root to: 'home#index'
  
#, only: [:index, :show]
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users
    end
  end

  
end

