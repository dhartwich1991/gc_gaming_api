class ChangeNameOfUserIdInCharacter < ActiveRecord::Migration
  def change
	rename_column :characters, :userid, :user_id
  end
end
