Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'postcode#index'

  get '/search', to: 'postcode#search'
end
