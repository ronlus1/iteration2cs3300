Rails.application.routes.draw do
  root "addcustomers#index"
  resources :addcustomers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
