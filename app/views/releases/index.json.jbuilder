json.array!(@releases) do |release|
  json.extract! release, :id, :project_id
  json.url release_url(release, format: :json)
end
