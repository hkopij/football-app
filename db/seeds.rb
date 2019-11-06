# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
League.create(name: "Premier League", country: "England", api_league_id: 148)
League.create(name: "Bundesliga", country: "Germany", api_league_id: 195)
League.create(name: "LaLiga", country: "Spain", api_league_id: 468)
League.create(name: "Ekstraklasa", country: "Poland", api_league_id: 381)
League.create(name: "Serie A", country: "Italy", api_league_id: 262)
