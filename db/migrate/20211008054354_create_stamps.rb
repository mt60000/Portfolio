class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.references :user, foreign_key: true
      t.references :dialy, foreign_key: true
      t.string :stamp_id

      t.timestamps
    end
  end
end
