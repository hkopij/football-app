require 'net/http'
require 'json'

namespace :leagues do
  desc 'Import available leagues'
  task :import_available_leagues => :environment do
    AvailableCountry.all.each do |country|
      url = "https://apiv2.apifootball.com/?action=get_leagues&country_id=#{country.country_id_api}&APIkey=59a8e0b3919e94cf76ad29c495984ccc8c5533d8e98cb0f00cebf0ba55580faf"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)

      output.each do |league|
        AvailableLeague.find_or_create_by(league_id_api: league['league_id']).update_attributes!(
          :name => league['league_name'],
          :country_name => country.name,
          :available_country => country
        )
      end
    end
  end

  desc 'Import league teams detailed information'
  task :import_league_details => :environment do
    League.all.each do |league|
      url = "https://apiv2.apifootball.com/?action=get_standings&league_id=#{league.api_league_id}&APIkey=59a8e0b3919e94cf76ad29c495984ccc8c5533d8e98cb0f00cebf0ba55580faf"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      output = JSON.parse(response)
      output.each do |team|
        LeagueParticipant.find_or_create_by(teamname: team['team_name']).update_attributes!(
          :position => team['overall_league_position'],
          :goals_scored => team['overall_league_GF'],
          :goals_lost => team['overall_league_GA'],
          :points => team['overall_league_PTS'],
          :league => league
        )
      end
    rescue TypeError
        next
    end
  end
end
