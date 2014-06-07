json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :product_owner_id, :scrum_master_id, :sprint_duration_in_weeks
  json.url project_url(project, format: :json)
end
