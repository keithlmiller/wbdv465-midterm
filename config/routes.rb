Wbdv465Midterm::Application.routes.draw do
  resources :lists do
    resources :books, only: [:new, :create, :destroy], controller: "user_books"
  end

  resources :books

  resources :sessions,   only: [:create]
  
  resources :users do
    resources :lists, controller: "users/lists"
  end

  get     "signup"       => "users#new",        as: "signup"
  get     "signin"       => "sessions#new",     as: "signin"
  delete  "signout"      => "sessions#destroy", as: "signout"

  root "books#index"
end
