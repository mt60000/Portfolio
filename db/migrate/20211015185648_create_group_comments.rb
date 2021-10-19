class CreateGroupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :group_comments do |t|
      t.references :user, foreign_key: true
      t.references :group_diary, foreign_key: true
      t.string :text, null: false

      t.timestamps
    end
  end
end
