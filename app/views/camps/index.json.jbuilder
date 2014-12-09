json.array!(@camps) do |camp|
  json.extract! camp, :id, :cid, :name, :organization_id, :address, :url, :description, :coords, :icon, :zoom, :angle, :tilt
  json.url camp_url(camp, format: :json)
end
