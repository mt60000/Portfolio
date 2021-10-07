class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.reference :user
      t.integer :mood
      t.string :keep
      t.string :problem
      t.string :try
      t.text :text
      t.string :image
      t.datetime :start_time

      t.timestamps
    end
  end
end
