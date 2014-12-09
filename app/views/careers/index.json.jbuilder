json.array!(@careers) do |career|
  json.extract! career, :id, :name, :url, :information, :faculty_id
  json.url career_url(career, format: :json)
end
