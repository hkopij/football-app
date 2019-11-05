class LeagueParticipant < ApplicationRecord
  belongs_to :league

  validates :teamname,
            :position,
            :goals_scored,
            :goals_lost,
            :points,
            presence: true
end
