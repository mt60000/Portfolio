class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :policy
      t.string :image

      t.timestamps
    end
  end
end
