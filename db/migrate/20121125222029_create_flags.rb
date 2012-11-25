class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user
      t.references :insult

      t.timestamps
    end
    add_index :flags, :user_id
    add_index :flags, :insult_id
  end
end
