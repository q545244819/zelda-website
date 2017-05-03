Rails.application.routes.draw do
  root 'home#index'

  resources 'categories'
  resources 'articles'

  get '/about', to: 'about#index'
  get '/admin', to: 'admin#index'
  get '/admin/articles', to: 'admin#articles'
  get '/admin/articles/new', to: 'admin#article_new'
  post '/admin/articles/new', to: 'articles#create'
  get '/admin/articles/:id', to: 'admin#article_edit'
  post '/admin/articles/:id', to: 'articles#update'
  get '/admin/articles/:id/remove', to: 'admin#article_destroy'
  get '/admin/categories', to: 'admin#categories'
  get '/admin/categories/:id', to: 'admin#category_edit'
  post '/admin/categories/:id', to: 'categories#update'
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end
