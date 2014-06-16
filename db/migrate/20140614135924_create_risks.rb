class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :identifier
      t.string :short_description
      t.text :detailed_description
      t.float :chance
      t.integer :responsible_id
      t.text :action_plan

      t.timestamps
    end
  end
end
