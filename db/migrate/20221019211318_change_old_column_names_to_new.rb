class ChangeOldColumnNamesToNew < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :first_team_score, :home_team_score
    rename_column :matches, :second_team_score, :away_team_score
  end
end
