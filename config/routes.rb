YelpRanker::Application.routes.draw do
  
  root to: "urls#index"

  # resources :urls

  post '/urls/parse_url/' => 'urls#parse_url'

end

