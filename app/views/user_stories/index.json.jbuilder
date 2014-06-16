json.array!(@user_stories) do |user_story|
  json.extract! user_story, :id, :description, :priority, :sprint_id, :user_id
  json.url user_story_url(user_story, format: :json)
end
