class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.text :description
      t.integer :priority
      t.integer :sprint_id
      t.integer :user_id

      t.timestamps
    end
  end
end
