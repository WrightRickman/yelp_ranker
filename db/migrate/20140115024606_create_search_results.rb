class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.text :result
      t.string :name

      t.timestamps
    end
  end
end
