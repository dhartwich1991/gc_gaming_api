class FixRaidsUsersTableName < ActiveRecord::Migration
  def change
    rename_table :raids_users :users_raids
  end
end
