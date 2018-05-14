Rails.application.routes.draw do
  resources :teams
  resources :historics
  resources :statuses
  resources :projects
  resources :categories
  resources :tasks do 
  	collection do
      put :play_pause	
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
