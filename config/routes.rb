Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pictures do
    resources :likes
    resources :comments
  end
  root "pictures#index"
end
