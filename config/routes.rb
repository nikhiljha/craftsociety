Rails.application.routes.draw do
  # Staticish
  root 'static_pages#home'
  get 'dashboard', to: 'player_pages#dashboard'

  # Auth
  devise_for :players, controllers: {
    registrations: 'players/registrations',
    invitations: 'players/invitations'
  }, skip: [:registrations]
  as :player do
    get 'players/edit' => 'devise/registrations#edit', :as => 'edit_player_registration'
    put 'players' => 'players/registrations#update', :as => 'player_registration'
  end

  # API
  get 'api/whitelist_check/:uuid', to: 'players#canplay'
end
