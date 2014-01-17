YelpRanker::Application.routes.draw do
  
  root to: "urls#index"

  post '/urls/parse_url/' => 'urls#parse_url'

  resources :urls do
  	put "upvote"
  	put "downvote"
  end

  devise_for :users

end

