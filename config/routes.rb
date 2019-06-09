Rails.application.routes.draw do
  get 'players/new'
  root 'static_pages#home'
  get 'api/whitelist_check/:uuid', to: 'players#canplay'
  get 'static_pages/about'
end
