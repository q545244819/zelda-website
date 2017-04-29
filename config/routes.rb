Rails.application.routes.draw do
  root 'home#index'

  resources 'categories'

  resources 'articles'
end
