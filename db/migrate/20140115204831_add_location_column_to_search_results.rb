class AddLocationColumnToSearchResults < ActiveRecord::Migration
  def change
  	add_column :search_results, :location, :string
  end
end
