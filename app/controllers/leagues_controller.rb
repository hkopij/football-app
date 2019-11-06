class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @leagues = League.all
    @available_leagues = AvailableLeague.all.sort_by
  end

  def add_league_to_favorites
    @league = League.find(params[:id])
    current_user.leagues << @league
    redirect_to root_path
  end

  def remove_league_from_favorites
    @league = League.find(params[:id])
    current_user.leagues.delete(@league)
    redirect_to root_path
  end

  def add_league_to_available_leagues
    @league = League.new
    @selected_league = AvailableLeague.find(params[:id])
    @league.api_league_id = @selected_league.league_id_api
    @league.name = @selected_league.name
    @league.country = @selected_league.country_name
    @league.save
    redirect_to root_path
  end
end
