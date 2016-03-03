json.array!(@proficiency_posts) do |proficiency_post|
  json.extract! proficiency_post, :id, :title, :username, :date, :content
  json.url proficiency_post_url(proficiency_post, format: :json)
end
