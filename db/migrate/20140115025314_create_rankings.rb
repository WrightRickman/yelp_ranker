class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :rank
      t.integer :result_id
      t.integer :user_id

      t.timestamps
    end
  end
end
