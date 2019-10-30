require 'httparty'

namespace :leagues do
  desc 'Import leagues'
  task :import_all_leagues => :environment do
    @url = "https://api.football-data.org/v2/competitions/"
    @headers = {
      'X-Auth-Token': '46a12534b02d4c2b960712990b195d28'
    }
    @response = HTTParty.get(@url, headers: @headers)

    @response['competitions'].select { |hash| hash['plan'] == "TIER_ONE"}.each do |league|
      League.find_or_create_by(api_league_id: league['id']).update_attributes!(
        :name => league['name'],
        :country => league['area']['name']
      )
    end

    @leagues = League.all
  end

  task :import_league_details => :environment do

  end
end
