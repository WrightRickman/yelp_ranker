class CreateUrlsTable < ActiveRecord::Migration
  def up
  	create_table :urls do |t|
  		t.string :url

  		t.timestamp
  	end
  end

  def down
  	drop_table :urls
  end
end
