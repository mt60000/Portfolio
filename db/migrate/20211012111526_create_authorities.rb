class CreateAuthorities < ActiveRecord::Migration[5.2]
  def change
    create_table :authorities do |t|
      t.boolean :delete_group, default: false
      t.boolean :change_group, default: false
      t.boolean :member_control, default: false
      t.timestamps
    end
  end
end
