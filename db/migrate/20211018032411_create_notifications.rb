class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.references :apply, foreign_key: true
      t.references :group, foreign_key: true
      t.references :group_diary, foreign_key: true
      t.references :group_favorite, foreign_key: true
      t.references :group_comment, foreign_key: true
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
  end
end
