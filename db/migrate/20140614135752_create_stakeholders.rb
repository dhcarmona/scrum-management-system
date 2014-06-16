class CreateStakeholders < ActiveRecord::Migration
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :expectations
      t.text :interest
      t.text :power
      t.integer :project_id

      t.timestamps
    end
  end
end
