json.array!(@events) do |event|
  # json.extract! event, :id, :name, :description
  json.id event.id
  json.title event.name
  json.description event.description
  json.start event.date_start
  json.end event.date_end
  json.url event_url(event, format: :html)
end