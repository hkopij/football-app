every 1.hour do
  rake "leagues:import_league_details", :environment => 'development'
end

every 1.day do
  rake "countries:import_available_countries", :environment => 'development'
  rake "leagues:import_available_leagues", :environment => 'development'
end
