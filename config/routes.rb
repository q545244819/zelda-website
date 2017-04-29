Rails.application.routes.draw do
  root 'home#index'

  get 'categories/:id', to: 'categories#index'
end
