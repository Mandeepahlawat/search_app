Rails.application.routes.draw do
  resources :users do
	  member do
	    post 'add_friend'
	  end
	end
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
