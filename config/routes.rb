Rails.application.routes.draw do
  # Static
  root 'static_pages#home'
  get 'static_pages/about'

  # Auth
  devise_for :players

  # API
  get 'api/whitelist_check/:uuid', to: 'players#canplay'
end
