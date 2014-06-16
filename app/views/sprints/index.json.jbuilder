json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :release_id, :sprint_review
  json.url sprint_url(sprint, format: :json)
end
