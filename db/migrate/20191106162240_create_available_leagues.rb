class CreateAvailableLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :available_leagues do |t|
      t.belongs_to :available_country
      t.integer :league_id_api
      t.string :country_name
      t.string :name
      t.timestamps
    end
  end
end
