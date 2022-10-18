Rails.application.routes.draw do
  resources :employee_ptos
  resources :employees
  resources :buildings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
