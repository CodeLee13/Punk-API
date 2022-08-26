Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/get-beer/:id', to: "beers#get_beer"
  get '/get-all-beers', to: "beers#get_all_beers"
  get '/search-beer/:name', to: "beers#search_beer"
end
