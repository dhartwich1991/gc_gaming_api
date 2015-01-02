class CreateUsersRaids < ActiveRecord::Migration
  def change
    create_table :users_raids do |t|
      t.references :user, index: true
      t.references :raid, index: true

      t.timestamps
    end
	add_index :users_raids, [:user_id, :raid_id], :unique => true
  end
end
