json.array!(@teams) do |team|
  json.extract! team, :id, :name, :description, :community_rating, :location, :picture_url
  json.url team_url(team, format: :json)
end
