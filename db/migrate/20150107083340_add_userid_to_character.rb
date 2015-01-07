class AddUseridToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :userid, :integer
  end
end
