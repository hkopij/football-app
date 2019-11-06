class AvailableLeaguesController < ApplicationController
  before_action :authenticate_user!

  def show
    @q = AvailableLeague.ransack(params[:q])
    @available_leagues = @q.result(distinct: true)
  end

  def add_available_league_to_leagues
    @league = League.new
    @selected_league = AvailableLeague.find(params[:id])
    @league.api_league_id = @selected_league.league_id_api
    @league.name = @selected_league.name
    @league.country = @selected_league.country_name
    @league.save
    redirect_to root_path
  end
end
