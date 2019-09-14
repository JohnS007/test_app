Rails.application.routes.draw do
  root 'welcome#home'
  get 'about', to: 'welcome#about'

  get 'signup', to: 'zusers#new'
  # post 'zusers', to: 'zusers#create'
  resources :zusers, except: [:new]
  resources :articles #gives the routes for articles controller.

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
