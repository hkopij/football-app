class LeaguesController < ApplicationController
  require 'httparty'
  before_action :authenticate_user!

  def index
    @url = "https://api.football-data.org/v2/competitions/"
    @headers = {
      'X-Auth-Token': '46a12534b02d4c2b960712990b195d28'
    }
    @response = HTTParty.get(@url, headers: @headers)

    @response['competitions'].select { |hash| hash['plan'] == "TIER_ONE"}.each do |league|
      League.find_or_create_by(name: league['name'], api_league_id: league['id'], country: league['area']['name'])
    end

    @leagues = League.all
  end

  def add_league_to_favorites
    @league = League.find(params[:id])
    current_user.leagues << @league
    redirect_to root_path
  end

  def remove_league_from_favorites
    @league = League.find(params[:id])
    current_user.leagues.find(@league.id).delete
    redirect_to root_path
  end
end
