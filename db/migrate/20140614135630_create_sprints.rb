class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :release_id
      t.text :sprint_review

      t.timestamps
    end
  end
end
