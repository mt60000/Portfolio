class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.references :user
      t.references :dialy
      t.integer :stamp

      t.timestamps
    end
  end
end
