Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"
  get "about-us", to: "about#index", as: "about"
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
