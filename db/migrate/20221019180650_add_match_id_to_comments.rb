class AddMatchIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :match_id, :integer
  end
end
