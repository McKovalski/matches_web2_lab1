class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text, :null => false
      t.integer :match_id, :null => false
      t.integer :username, :null => false

      t.timestamps
    end
  end
end
