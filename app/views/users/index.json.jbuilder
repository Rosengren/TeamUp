json.array!(@users) do |user|
  json.extract! user, :id, :username, :description, :picture_url, :permission_level
  json.url user_url(user, format: :json)
end
