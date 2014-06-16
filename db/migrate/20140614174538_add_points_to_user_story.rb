class AddPointsToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :points, :int
  end
end
