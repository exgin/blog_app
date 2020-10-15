Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do 
    # only for nested routes
    resources :comments
  end 
  root "posts#index"
end
