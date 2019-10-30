class AddPointsToLeagueParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :league_participants, :points, :integer
  end
end
