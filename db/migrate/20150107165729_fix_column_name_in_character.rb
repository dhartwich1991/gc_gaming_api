class FixColumnNameInCharacter < ActiveRecord::Migration
  def change
    rename_column :characters, :class, :character_class
  end
end
