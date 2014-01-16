class AddUserRankColumnToSearchResults < ActiveRecord::Migration
  def change
  	add_column :search_results, :rank, :integer
  end
end
