Rails.application.routes.draw do
  
  resources :save_sims
  resources :save_cards
  resources :savings
  resources :sim_transactions
  resources :card_transactions
  resources :cards
  resources :sims
  resources :users
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
