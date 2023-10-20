Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  constraints format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'auth/registrations'
    }

    resource :notifications, only: %i[create show update]
    resource :total_shortened_lifespans, only: %i[create show update]
    resources :one_day_times, only: %i[create update index]
    get '/one_day_times/today', to: 'one_day_times#show_today'
    get '/one_day_times/today_count_up', to: 'one_day_times#show_today_count_up'
    get '/one_day_times/today_shortened_lifespan', to: 'one_day_times#show_today_shortened_lifespan'
    resources :messages, only: %i[index destroy] do
      member do
        resources :likes, only: %i[create]
      end
    end
    resources :likes, only: %i[destroy]
  end
end
