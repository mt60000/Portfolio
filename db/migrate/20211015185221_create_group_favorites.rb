class CreateGroupFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :group_favorites do |t|
      t.references :user, foreign_key: true
      t.references :group_diary, foreign_key: true

      t.timestamps
    end
  end
end
