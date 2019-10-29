class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.belongs_to :user
      t.integer :api_league_id
      t.timestamps
    end
  end
end
