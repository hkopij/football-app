require 'net/http'
require 'json'

namespace :countries do
  desc 'Import available countries'
  task :import_available_countries => :environment do
    url = "https://apiv2.apifootball.com/?action=get_countries&APIkey=59a8e0b3919e94cf76ad29c495984ccc8c5533d8e98cb0f00cebf0ba55580faf"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    output = JSON.parse(response)

    output.each do |country|
      AvailableCountry.find_or_create_by(country_id_api: country['country_id']).update_attributes!(
        :name => country['country_name']
      )
    end
  end
end
