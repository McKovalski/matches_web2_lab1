class Match < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :home_team, foreign_key: :home_team_id, class_name: 'Team'
    belongs_to :away_team, foreign_key: :away_team_id, class_name: 'Team'
    validates :time_of_play, presence: true
end
