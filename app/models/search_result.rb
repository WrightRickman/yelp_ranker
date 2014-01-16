class SearchResult < ActiveRecord::Base
  attr_accessible :name, :rating, :rating_img_url, :url, :display_phone, :term, :location, :rank
end
