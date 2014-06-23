class CreateAddedTimes < ActiveRecord::Migration
  def change
    create_table :added_times do |t|
      t.integer :hours
      t.datetime :datetime
      t.integer :user_story_task_id

      t.timestamps
    end
  end
end
