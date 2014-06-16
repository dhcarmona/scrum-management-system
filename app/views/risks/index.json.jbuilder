json.array!(@risks) do |risk|
  json.extract! risk, :id, :identifier, :short_description, :detailed_description, :chance, :responsible_id, :action_plan
  json.url risk_url(risk, format: :json)
end
