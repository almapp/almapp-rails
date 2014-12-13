json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :publish_date, :place_id, :from_date, :to_date, :slug, :user_id, :group_id, :facebook_url, :external_url, :private
  json.url event_url(event, format: :json)
end
