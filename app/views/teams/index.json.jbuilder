json.array!(@teams) do |team|
  json.extract! team, :id, :id, :name, :game, :description, :community_rating, :location, :picture_url
  json.url team_url(team, format: :json)
end
