class RemoveIsFlaggedFromInsults < ActiveRecord::Migration
  def up
    remove_column :insults, :is_flagged
  end

  def down
    add_column :insults, :is_flagged, :boolean
  end
end
