class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.time :time_of_play
      t.integer :first_team_score
      t.integer :second_team_score

      t.timestamps
    end
  end
end
