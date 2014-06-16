json.array!(@success_criterions) do |success_criterion|
  json.extract! success_criterion, :id, :description, :completed, :user_story_task_id
  json.url success_criterion_url(success_criterion, format: :json)
end
