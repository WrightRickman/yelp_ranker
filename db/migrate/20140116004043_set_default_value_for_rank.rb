class SetDefaultValueForRank < ActiveRecord::Migration
  def up
  	add_column :search_results, :rank, :integer, :default => 0
  end

  def down
  	remove_column :search_results, :rank
  end
end
