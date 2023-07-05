Rails.application.routes.draw do
  
  resources :save_sims
  resources :save_cards
  resources :savings
  resources :sim_transactions
  resources :card_transactions
  resources :cards
  resources :sims
  resources :users

  get "/simCat/:id", to: "users#simCat"
  get "/cardCat/:id", to: "users#cardCat"
  
  get "/topSim/:id", to: "users#topSim"
  get "/topCard/:id", to: "users#topCard"

  get "/userSims/:id", to: "users#userSim"
  get "/userCards/:id", to: "users#userCard"

  get "/simUsage/:id", to: "users#simUsage"
  get "/cardUsage/:id", to: "users#cardUsage"

  post "/login", to: "sessions#create"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
