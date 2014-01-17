class AddSnippetImageUrlToSearchResults < ActiveRecord::Migration
def up
  	add_column :search_results, :snippet_img_url, :text
  end

  def down
  	remove_column :search_results, :snippet_img_url
  end
end
