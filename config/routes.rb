Rails.application.routes.draw do
  root 'home#index'

  resources 'categories'
  resources 'articles'

  get '/about', to: 'about#index'
  get '/admin', to: 'admin#index'
  get '/admin/articles', to: 'admin#articles'
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end
