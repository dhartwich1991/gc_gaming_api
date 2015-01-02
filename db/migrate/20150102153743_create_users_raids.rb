class CreateUsersRaids < ActiveRecord::Migration
  def change
    create_table :users_raids, :id => false do |t|
    	t.references :user
    	t.references :raid
    end
    add_index :users_raids, [:user_id, :raid_id]
    add_index :users_raids, :user_id
  end
end
