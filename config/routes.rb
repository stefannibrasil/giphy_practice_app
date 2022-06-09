Rails.application.routes.draw do
  root "gifs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :gifs
end