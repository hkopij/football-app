class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @leagues = League.all
    @q = AvailableLeague.ransack(params[:q])
    @available_leagues = @q.result(distinct: true)
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
end
