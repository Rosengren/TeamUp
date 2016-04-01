require 'fuzzy_match'

class Search::AllController < ApplicationController

  # GET /search/all?q={username}
  def index
    users = FuzzyMatch.new(User.all, :read => :username)
    games = FuzzyMatch.new(Game.all, :read => :name)
    profs = FuzzyMatch.new(Proficiency.all, :read => :name)
    teams = FuzzyMatch.new(Team.all, :read => :name)

    results = []
    users.find_all(params[:q]).each do |user|
      results.push({
        category: 'Users',
        id: user.id,
        name: user.username,
        url: "/users/" + user.username.downcase
      })
    end

    games.find_all(params[:q]).each do |game|
      results.push({
        category: 'Games',
        id: game.id,
        name: game.name,
        url: '/games/' + game.name.tr(' ', '-').downcase
      })
    end

    profs.find_all(params[:q]).each do |proficiency|
      results.push({
        category: 'Proficiencies',
        id: proficiency.id,
        name: proficiency.name,
        url: '/games/' + proficiency.game.name.tr(' ', '-').downcase + '/proficiencies/' + proficiency.name.downcase
      })
    end

    teams.find_all(params[:q]).each do |team|
      results.push({
        category: 'Teams',
        id: team.id,
        name: team.name,
        url: '/teams/' + team.name.downcase
      })
    end

    render :json => results
  end
end
