class ChangeTimeToDatetime < ActiveRecord::Migration[7.0]
  def change
    change_column(:matches, :time_of_play, :datetime)
  end
end
