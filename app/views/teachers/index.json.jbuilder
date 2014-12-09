json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email, :information, :url
  json.url teacher_url(teacher, format: :json)
end
