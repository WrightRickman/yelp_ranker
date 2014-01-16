class RemoveRankColumnFromRankingsTable < ActiveRecord::Migration
  def change
  	remove_column :rankings, :rank
  end
end
