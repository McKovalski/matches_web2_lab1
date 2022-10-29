class MakeColumnsNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :matches, :time_of_play, false
    change_column_null :matches, :home_team_id, false
    change_column_null :matches, :away_team_id, false
    change_column_null :teams, :name, false
    change_column_null :comments, :text, false
  end
end
