class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.references :user, foreign_key: true
      t.integer :mood_id
      t.string :keep
      t.string :problem
      t.string :try
      t.text :text
      t.string :image_id
      t.string :start_time

      t.timestamps
    end
  end
end
