json.array!(@correspondences) do |correspondence|
  json.extract! correspondence, :id, :email, :name, :team, :restaurant_id, :token
  json.url correspondence_url(correspondence, format: :json)
end
