class ChangeUserIdToNickname < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :username
    change_column :comments, :username, :text
  end
end
