Rails.application.routes.draw do
  get 'players/new'
  root 'static_pages#home'
  get 'static_pages/about'
end
