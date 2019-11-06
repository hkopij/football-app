class CreateAvailableCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :available_countries do |t|
      t.string :name
      t.integer :country_id_api
      t.timestamps
    end
  end
end
