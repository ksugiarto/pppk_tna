json.array!(@events) do |event|
  # json.extract! event, :id, :title, :description
  json.id event.id
  json.title event.title
  json.description event.description
  json.start event.date_start
  json.end event.date_end
  json.url event_url(event, format: :html)
end