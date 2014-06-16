class AddProjectIdToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :project_id, :integer
  end
end
