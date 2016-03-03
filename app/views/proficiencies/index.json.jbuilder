json.array!(@proficiencies) do |proficiency|
  json.extract! proficiency, :id, :game, :name, :description, :picture_url
  json.url proficiency_url(proficiency, format: :json)
end
