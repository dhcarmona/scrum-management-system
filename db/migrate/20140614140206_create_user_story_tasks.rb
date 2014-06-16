class CreateUserStoryTasks < ActiveRecord::Migration
  def change
    create_table :user_story_tasks do |t|
      t.text :description
      t.integer :user_story_id
      t.integer :stimated_effort_in_hours
      t.integer :actual_effort_in_hours

      t.timestamps
    end
  end
end
