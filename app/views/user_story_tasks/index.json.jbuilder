json.array!(@user_story_tasks) do |user_story_task|
  json.extract! user_story_task, :id, :description, :user_story_id, :stimated_effort_in_hours, :actual_effort_in_hours
  json.url user_story_task_url(user_story_task, format: :json)
end
