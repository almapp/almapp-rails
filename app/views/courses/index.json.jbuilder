json.array!(@courses) do |course|
  json.extract! course, :id, :initials, :name, :credits, :availability, :description, :capacity, :enrolled
  json.url course_url(course, format: :json)
end
