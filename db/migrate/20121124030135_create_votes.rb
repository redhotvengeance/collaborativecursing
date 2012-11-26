class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :insult

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :insult_id
  end
end
