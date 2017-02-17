Rails.application.routes.draw do

  post "/emojis", to:'emojis#create'
  get "/emojis", to:'emojis#index'
  get "/emojis/new", to: 'emojis#new'
  get "/emojis/:id", to:'emojis#show'
  get "/emojis/:id/edit", to: 'emojis#edit'
  patch "/emojis/:id", to: 'emojis#update'
  delete "/emojis/:id", to: 'emojis#destroy'
  
end
