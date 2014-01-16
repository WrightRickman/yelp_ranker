class AddTermColumnToSearchResults < ActiveRecord::Migration
  def change
  	add_column :search_results, :term, :string
  end
end
