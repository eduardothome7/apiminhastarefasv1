Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :teams
  resources :statuses
  resources :projects
  resources :categories
  
  resources :tasks do 
    resources :historics
    collection do
      put :play_pause	
  	end
  end
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
