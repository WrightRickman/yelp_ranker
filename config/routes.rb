YelpRanker::Application.routes.draw do
  
  root to: "urls#index"

  # resources :urls

  post '/urls/parse_url/' => 'urls#parse_url'

  put 'urls/upvote' => "urls#upvote"

  put 'urls/downvote' => "urls#downvote"

  devise_for :users

end

