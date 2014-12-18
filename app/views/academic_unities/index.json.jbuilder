json.array!(@academic_unities) do |academic_unity|
  json.extract! academic_unity, :id, :name, :faculty_id, :url, :email, :address, :information, :facebook, :twitter
  json.url academic_unity_url(academic_unity, format: :json)
end
