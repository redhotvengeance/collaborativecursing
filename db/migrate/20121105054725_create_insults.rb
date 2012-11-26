class CreateInsults < ActiveRecord::Migration
  def change
    create_table :insults do |t|
      t.string :insult
      t.integer :points, :default => 0
      t.references :user
      t.boolean :is_flagged, :default => false

      t.timestamps
    end
    add_index :insults, :user_id
  end
end
