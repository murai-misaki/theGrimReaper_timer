Rails.application.routes.draw do
  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'
    }

    resource :notifications, only: %i[create show update]
    resource :total_shortened_lifespans, only: %i[create show update]
    resources :one_day_times, only: %i[create update index]
    get '/one_day_times/today', to: 'one_day_times#show_today'
  end
end
