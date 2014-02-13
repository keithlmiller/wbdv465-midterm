Wbdv465Midterm::Application.routes.draw do
  resources :lists

  resources :user_books

  resources :books

  resources :sessions,   only: [:create]
  resources :users

  get     "signup"       => "users#new",        as: "signup"
  get     "signin"       => "sessions#new",     as: "signin"
  delete  "signout"      => "sessions#destroy", as: "signout"

  root "books#index"
end
