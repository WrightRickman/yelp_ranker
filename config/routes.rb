YelpRanker::Application.routes.draw do
  
  root to: "urls#index"

  post '/urls/parse_url/' => 'urls#parse_url'

  resources :urls do
  	put "upvote"
  	put "downvote"
  end

  # put '/urls/:id/upvote' => "urls#upvote"

  # put '/urls/:id/downvote' => "urls#downvote"

  devise_for :users

end

