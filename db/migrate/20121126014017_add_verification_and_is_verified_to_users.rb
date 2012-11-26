class AddVerificationAndIsVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verification, :string
    add_column :users, :is_verified, :boolean
  end
end
