YelpRanker::Application.routes.draw do
  
  root to: 'urls#index'

  get '/urls/:url_string' => 'urls#parse_url'

end

