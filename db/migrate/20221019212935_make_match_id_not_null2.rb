class MakeMatchIdNotNull2 < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :match_id, false
  end
end
