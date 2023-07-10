# [POCKETS(backend)](https://ai-hub-1.vercel.app/)

The API to [Pockets](https://pocketswatch.vercel.app/)

## Table of Contents

1. [Getting started](#Getting-started)
2. [Usage](#Usage)
3. [Relationships](#relations)
3. [Models](#Methods)
   - [Users](#user)
   - [Cards](#card)
   - [Sim](#sim)
   - [Saving](#saving)
   - [Card savings](#save_cards)
   - [Sim savings](#save_sims)
4. [Routes](#routes)
6. [Contributors](#contributors)
7. [Licenses](#license)
8. [Resources](#Sources)

## <a id="Getting-started">Getting started</a>

The project runs on rails and postgesql

### 1. Website

You can access the site on [pockets-backend](https://pockets.onrender.com/)

### 2. Cloning

**Clone** the project files to your local repository:

- HTTPS => `https://github.com/edd-ie/pockets-b.git`
- SSH => `git@github.com:edd-ie/pockets-b.git`
- Git CLI => `gh repo clone edd-ie/pockets-b`

Open the terminal and install all dependencies using.

```
bundle install
```

After installation run this command to start the rails server

```
rails s
```

Your default browser will be launched and the homepage will be rendered

## <a id="relations">Relationships</a>
![Alt text](database.drawio.png)

### One-to-Many
Users has many:
 - Cards
 - Sims
 - Savings

Card has many:
  - Transactions
  - Save contributions

Sim has many:
  - Transactions
  - Save contributions

Card has many:
  - Card contributions
  - sim contributions

### Many-to-Many
User has many:
  - Card transactions through cards
  - Sim transactions through sims
  - Sim contributions through savings
  - Card contributions through savings

Savings has many:
  - Cards through cards savings
  - Sims through sim savings

Card has many:
  - Savings through card savings

Sim has many:
  - Savings through Sim savings

## <a id="Methods">Models</a>

This handles the logic for the data sourcing from the data

### <a id="users">User</a>
User logic

### <a id="card">Card</a>
Card Logic

### <a id="sim">Sim</a>
Sim Logic

### <a id="saving">Saving</a>
Savings logic

### <a id="save_cards">Card savings</a>
Card savings logic

### <a id="save_sims">Sim savings</a>
Sim saving logic

## <a id="routes">Routes</a>
The routes the have full http requests functionality(GET, POST, DELETE, PATCH, PUT)
```
/users
/savings
/cards
/sims
/save_cards
/save_sims
/sessions
```

### Custom routes
For added functionality some custom routes were created to help get specific data from database
```
  patch "/changePass", to: "users#changePass"

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
```


## <a id="contributors">Contributors</a>

This project was a team effort from the following individuals :

- [Edd.ie](https://github.com/edd-ie)
- [Glory](https://github.com/Nkathaglow)
- [Austin](https://github.com/Naulikha)

## <a id="license">Licenses</a>

The project is licensed under the [BSD 3-Clause "New" or "Revised" License](https://github.com/highlightjs/highlight.js/blob/main/LICENSE), thus redistribution and use in source and binary forms are permitted provided that the conditions are met

## <a id="sources">Resources</a>
WebPage -> [pockets backend]('https://pockets.onrender.com/')

Database hosting-> [postgres]('https://dashboard.render.com/')
