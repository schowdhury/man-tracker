json.array!(@events) do |event|
  json.extract! event, :id, :user_agent, :ip
  json.url event_url(event, format: :json)
end
