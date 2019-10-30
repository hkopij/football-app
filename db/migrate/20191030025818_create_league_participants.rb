class CreateLeagueParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :league_participants do |t|
      t.belongs_to :league
      t.string :teamname
      t.integer :position
      t.integer :goals_scored
      t.integer :goals_lost
      t.timestamps
    end
  end
end
