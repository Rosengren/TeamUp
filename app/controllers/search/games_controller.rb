require 'fuzzy_match'

class Search::GamesController < ApplicationController

  # GET /search/games?q={query}
  def index

    if params[:q].blank?
      games = Game.all
    else
      games = FuzzyMatch.new(Game.all, :read => :name).find_all(params[:q])
    end

    results = []
    games.each do |game|
      results.push({
        name: game.name,
        value: game.id
      })
    end

    render :json => {
      success: true,
      results: results
    }
  end
end
