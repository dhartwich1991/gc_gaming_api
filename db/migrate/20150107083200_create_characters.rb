class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :lastModified
      t.string :name
      t.string :realm
      t.string :battlegroup
      t.integer :class
      t.integer :race
      t.integer :gender
      t.integer :level
      t.integer :achievementPoints
      t.string :thumbnailurl
      t.integer :itemleveltotal
      t.integer :itemlevelequipped

      t.timestamps
    end
  end
end
