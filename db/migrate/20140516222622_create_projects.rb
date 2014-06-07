class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :product_owner_id
      t.integer :scrum_master_id
      t.integer :sprint_duration_in_weeks

      t.timestamps
    end
  end
end
