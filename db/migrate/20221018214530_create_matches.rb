class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.datetime :time_of_play, :null => false
      t.integer :home_team_score
      t.integer :away_team_score
      t.integer :home_team_id, :null => false
      t.integer :away_team_id, :null => false

      t.timestamps
    end
  end
end
