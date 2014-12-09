json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :fid, :name, :camp_id, :address, :url, :description, :coords, :icon, :zoom, :angle, :tilt
  json.url faculty_url(faculty, format: :json)
end
