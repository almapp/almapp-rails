json.array!(@groups) do |group|
  json.extract! group, :id, :name, :email, :url, :facebook, :twitter, :information, :expiration, :organization_id
  json.url group_url(group, format: :json)
end
