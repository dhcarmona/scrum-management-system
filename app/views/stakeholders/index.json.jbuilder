json.array!(@stakeholders) do |stakeholder|
  json.extract! stakeholder, :id, :name, :email, :phone_number, :expectations, :interest, :power, :project_id
  json.url stakeholder_url(stakeholder, format: :json)
end
