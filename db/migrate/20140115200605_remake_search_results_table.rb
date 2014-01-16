class RemakeSearchResultsTable < ActiveRecord::Migration
  def change
  	drop_table :search_results

  	create_table :search_results do |t|
  		t.float :rating
  		t.text :rating_img_url
  		t.text :url
  		t.string :name
  		t.string :display_phone

  		t.timestamps
  	end
  end
end
