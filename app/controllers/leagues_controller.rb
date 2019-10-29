class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    require 'httparty'

    @url = "https://api.football-data.org/v2/competitions/"
    @headers = {
      'X-Auth-Token': '46a12534b02d4c2b960712990b195d28'
    }
    @response = HTTParty.get(@url, headers: @headers)

  end
  # 
  # def add_league_to_favorites(league_id)
  #   @league = current_user.leagues.build(league_params)
  #   @league.save
  # end

  private

  # def league_params
  #   params.require(league).permit(:user, :api_league_id)
  # end

end
