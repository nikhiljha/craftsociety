Rails.application.routes.draw do
  # Staticish
  root 'static_pages#home'
  get 'dashboard', to: 'player_pages#dashboard'

  # Auth
  devise_for :players, controllers: {
    registrations: 'players/registrations'
  }

  # API
  get 'api/whitelist_check/:uuid', to: 'players#canplay'
end
