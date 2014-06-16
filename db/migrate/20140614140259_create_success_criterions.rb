class CreateSuccessCriterions < ActiveRecord::Migration
  def change
    create_table :success_criterions do |t|
      t.text :description
      t.boolean :completed
      t.integer :user_story_task_id

      t.timestamps
    end
  end
end
