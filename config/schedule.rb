every 1.hour do
  rake "leagues:import_all_leagues", :environment => 'development'
  rake "leagues:import_league_details", :environment => 'development'
end
