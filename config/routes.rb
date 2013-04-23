CatAngular::Application.routes.draw do
  authenticated :users do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end