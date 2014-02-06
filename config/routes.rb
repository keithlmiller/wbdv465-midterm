Wbdv465Midterm::Application.routes.draw do
  resources :sessions,   only: [:create]
  resources :users

  get     "signup"       => "users#new",        as: "signup"
  get     "signin"       => "sessions#new",     as: "signin"
  delete  "signout"      => "sessions#destroy", as: "signout"

  root "users#index"
end