json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :poster, :start, :venue_title, :address_1, :address_2, :city, :state, :zip
  json.url event_url(event, format: :json)
end
