Rails.application.routes.draw do
  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'
    }

    resource :notifications, only: %i[create edit update]
    resource :total_shortened_lifespans, only: %i[create show update]
  end
end
