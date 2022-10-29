class AddNewColumnsToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :home_team_id, :integer
    add_column :matches, :away_team_id, :integer
  end
end
