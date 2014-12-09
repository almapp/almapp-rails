json.array!(@places) do |place|
  json.extract! place, :id, :pid, :name, :faculty_id, :coords, :floor, :icon, :description, :zoom, :angle, :tilt
  json.url place_url(place, format: :json)
end
