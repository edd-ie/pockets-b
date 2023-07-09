Rails.application.routes.draw do
  
  resources :save_sims
  resources :save_cards
  resources :savings
  resources :sim_transactions
  resources :card_transactions
  resources :cards
  resources :sims
  resources :users
  resource :sessions

  get "/simCat/:id", to: "users#simCat"
  get "/cardCat/:id", to: "users#cardCat"

  post '/addSaveCard/:id', to: "savings#addCardSave"
  post '/addSaveSim/:id', to: "savings#addSimSave"
  
  get "/topSim/:id", to: "users#topSim"
  get "/topCard/:id", to: "users#topCard"

  get "/userSims/:id", to: "users#userSim"
  get "/userCards/:id", to: "users#userCard"

  get "/simUsage/:id", to: "users#simUsage"
  get "/cardUsage/:id", to: "users#cardUsage"

  get '/uSimBal/:id', to: "users#simBal"
  get '/uCardBal/:id', to: "users#cardBal"

  get '/userSaves/:id', to: "users#userSavings"

  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  delete "/logout", to: "sessions#destroy"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
