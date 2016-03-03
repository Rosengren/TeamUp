json.array!(@user_proficiencies) do |user_proficiency|
  json.extract! user_proficiency, :id, :endorsements
  json.url user_proficiency_url(user_proficiency, format: :json)
end
