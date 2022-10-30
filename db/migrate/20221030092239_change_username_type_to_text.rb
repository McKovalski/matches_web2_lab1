class ChangeUsernameTypeToText < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :username, :text
  end
end
