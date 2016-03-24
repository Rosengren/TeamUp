require 'fuzzy_match'

class Search::ProficienciesController < ApplicationController

  # GET /search/proficiencies?game={id}&q={query}
  def index
    game = Game.find(params[:game])

    if params[:q].blank?
      proficiencies = game.proficiencies
    else
      proficiencies = FuzzyMatch.new(game.proficiencies, :read => :name).find_all(params[:q])
    end

    results = []
    proficiencies.each do |proficiency|
      results.push({
        name: proficiency.name,
        value: proficiency.id
      })
    end

    render :json => {
      success: true,
      results: results
    }
  end
end
