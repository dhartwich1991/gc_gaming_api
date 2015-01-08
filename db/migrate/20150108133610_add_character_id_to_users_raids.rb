class AddCharacterIdToUsersRaids < ActiveRecord::Migration
  def change
    add_column :users_raids, :characterid, :integer
    add_column :users_raids, :role, :string
  end
end
