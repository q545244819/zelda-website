Rails.application.routes.draw do
  root 'home#index'

  resources 'categories'
  resources 'articles'

  get '/about', to: 'about#index'
  get '/admin', to: 'admin#index'
  get '/admin/articles', to: 'admin#articles'
  get '/admin/articles/new', to: 'admin#article_new'
  post '/admin/articles/new', to: 'admin#article_create'
  get '/admin/articles/:id', to: 'admin#article_edit'
  post '/admin/articles/:id', to: 'admin#article_update'
  get '/admin/articles/:id/remove', to: 'admin#article_destroy'
  get '/admin/categories', to: 'admin#categories'
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end
